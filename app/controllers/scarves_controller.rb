class ScarvesController < ApplicationController
  before_action :set_scarf, only: [:show, :edit, :update, :destroy]

  # GET /scarves
  # GET /scarves.json
  def index
    @scarves = Scarf.all.order("updated_at DESC")

    @scarves = @scarves.scarf_name(params[:scarf_name].strip) if params[:scarf_name].present?
    @scarves = @scarves.descrip(params[:description].strip) if params[:description].present?

  end

  # GET /scarves/1
  # GET /scarves/1.json
  def show

  end

  # GET /scarves/new
  def new
    @scarf = Scarf.new
  end

  def scheme
    base_color = params['baseColor'][1..-1]
    pallete_num = params['palleteNum']
    scheme_type = params['schemeType']

    response = HTTParty.get("http://thecolorapi.com/scheme?hex=#{base_color}&mode=#{scheme_type}&count=#{pallete_num}")
    scheme_cols = response['colors']

    respond_to do |format|
        format.html { redirect_to scarf_path(Scarf.find(4)), notice: "Here's your new colours" }
        format.json { render json: response}
    end


    # return redirect_to scarf_path(Scarf.find(4)), notice: "#{base_color}"
  end

  # GET /scarves/1/edit
  def edit
    if not_allowed?
      return redirect_to scarf_path(@scarf), notice: "Sorry. You do not have the permission to edit a scarf that you didn't make yourself."
    end
  end

  # POST /scarves
  # POST /scarves.json
  def create
    @scarf = Scarf.new(scarf_params)
    @scarf.user = current_user
    unixtime = @scarf.date_insp.to_time.to_i
    glat = @scarf.city.lat
    glng = @scarf.city.lng

    response = HTTParty.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET']}/#{glat},#{glng},#{unixtime}?exclude=currently,flags")

    rawpattern = []

    #parse resonse to make pattern
    response['hourly']['data'].each do |hour|\
      str = scarf_params['weather_insp']
      rawpattern << hour["#{str}"]
    end

    @scarf.pattern = rawpattern

    respond_to do |format|
      if @scarf.save
        format.js   {  }
        format.html { redirect_to @scarf, notice: 'Scarf was successfully created.' }
        format.json { render :show, status: :created, location: @scarf }
      else
        format.html { render :new }
        format.json { render json: @scarf.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /scarves/1
  # PATCH/PUT /scarves/1.json
  def update
    respond_to do |format|
      if @scarf.update(scarf_params)

        unixtime = @scarf.date_insp.to_time.to_i
        glat = @scarf.city.lat
        glng = @scarf.city.lng

        response = HTTParty.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET']}/#{glat},#{glng},#{unixtime}?exclude=currently,flags")

        rawpattern = []

        #parse resonse to make pattern
        response['hourly']['data'].each do |hour|\
          str = scarf_params['weather_insp']
          rawpattern << hour["#{str}"]
        end        

        @scarf.update(pattern: rawpattern)
        format.html { redirect_to @scarf, notice: 'Scarf was successfully updated.' }
        format.json { render :show, status: :ok, location: @scarf }
      else
        format.html { render :edit }
        format.json { render json: @scarf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scarves/1
  # DELETE /scarves/1.json
  def destroy
    if not_allowed?
      return redirect_to scarf_path(@scarf), notice: "Sorry. You do not have the permission to delete a scarf that you didn't make yourself."      
    else
      @scarf.destroy
      respond_to do |format|
        format.html { redirect_to scarves_url, notice: 'Scarf was successfully destroyed.' }
        format.json { head :no_content }
      end
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scarf
      @scarf = Scarf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scarf_params
      params.require(:scarf).permit(:title, :description, :city_id, :date_insp, :weather_insp)
    end

    def not_allowed?
      current_user == nil or !(current_user.superadmin? or @scarf.user == current_user)
    end

end

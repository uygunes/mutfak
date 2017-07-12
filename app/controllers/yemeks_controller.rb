class YemeksController < ApplicationController
  before_action :set_yemek, only: [:show, :edit, :update, :destroy]
 
  # GET /yemeks
  # GET /yemeks.json
  def index
    @yemeks = Yemek.all
  end

  # GET /yemeks/1
  # GET /yemeks/1.json
  def show
    @yemekMalzemes = YemekMalzeme.where(:yemek_id => @yemek.id)
  end

  # GET /yemeks/new
  def new
    @yemek = Yemek.new
  end

  # GET /yemeks/1/edit
  def edit
  end

  # POST /yemeks
  # POST /yemeks.json
  def create
    @yemek = Yemek.new(yemek_params)
    puts yemek_params[:yemek_malzemes_attributes]
    @yemekMalzeme = YemekMalzeme.new()

    respond_to do |format|
      if @yemek.save
        format.html { redirect_to @yemek, notice: 'Yemek was successfully created.' }
        format.json { render :show, status: :created, location: @yemek }
      else
        format.html { render :new }
        format.json { render json: @yemek.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yemeks/1
  # PATCH/PUT /yemeks/1.json
  def update
    respond_to do |format|
      if @yemek.update(yemek_params)
        format.html { redirect_to @yemek, notice: 'Yemek was successfully updated.' }
        format.json { render :show, status: :ok, location: @yemek }
      else
        format.html { render :edit }
        format.json { render json: @yemek.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yemeks/1
  # DELETE /yemeks/1.json
  def destroy
    @yemek.destroy
    respond_to do |format|
      format.html { redirect_to yemeks_url, notice: 'Yemek was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yemek
      @yemek = Yemek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yemek_params
      params.require(:yemek).permit(:isim,:kisi,yemek_malzemes_attributes: [:id, :malzeme_id, :miktar, :_destroy])
    end
end

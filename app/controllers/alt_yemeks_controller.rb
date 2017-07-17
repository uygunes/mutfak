class AltYemeksController < ApplicationController
  before_action :set_alt_yemek, only: [:show, :edit, :update, :destroy]

  # GET /alt_yemeks
  # GET /alt_yemeks.json
  def index
    @alt_yemeks = AltYemek.all
  end

  # GET /alt_yemeks/1
  # GET /alt_yemeks/1.json
  def show
  end

  # GET /alt_yemeks/new
  def new
    @alt_yemek = AltYemek.new
  end

  # GET /alt_yemeks/1/edit
  def edit
  end

  # POST /alt_yemeks
  # POST /alt_yemeks.json
  def create
    @alt_yemek = AltYemek.new(alt_yemek_params)

    respond_to do |format|
      if @alt_yemek.save
        format.html { redirect_to @alt_yemek, notice: 'Alt yemek was successfully created.' }
        format.json { render :show, status: :created, location: @alt_yemek }
      else
        format.html { render :new }
        format.json { render json: @alt_yemek.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alt_yemeks/1
  # PATCH/PUT /alt_yemeks/1.json
  def update
    respond_to do |format|
      if @alt_yemek.update(alt_yemek_params)
        format.html { redirect_to @alt_yemek, notice: 'Alt yemek was successfully updated.' }
        format.json { render :show, status: :ok, location: @alt_yemek }
      else
        format.html { render :edit }
        format.json { render json: @alt_yemek.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alt_yemeks/1
  # DELETE /alt_yemeks/1.json
  def destroy
    @alt_yemek.destroy
    respond_to do |format|
      format.html { redirect_to alt_yemeks_url, notice: 'Alt yemek was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alt_yemek
      @alt_yemek = AltYemek.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alt_yemek_params
      params.require(:alt_yemek).permit(:isim, :yemek_kategori_id)
    end
end

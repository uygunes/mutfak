class YemekKategorisController < ApplicationController
  before_action :set_yemek_kategori, only: [:show, :edit, :update, :destroy]

  # GET /yemek_kategoris
  # GET /yemek_kategoris.json
  def index
    @yemek_kategoris = YemekKategori.all
  end

  # GET /yemek_kategoris/1
  # GET /yemek_kategoris/1.json
  def show
  end

  # GET /yemek_kategoris/new
  def new
    @yemek_kategori = YemekKategori.new
  end

  # GET /yemek_kategoris/1/edit
  def edit
  end

  # POST /yemek_kategoris
  # POST /yemek_kategoris.json
  def create
    @yemek_kategori = YemekKategori.new(yemek_kategori_params)

    respond_to do |format|
      if @yemek_kategori.save
        format.html { redirect_to yemek_kategoris_path, notice: 'Yemek kategori was successfully created.' }
        format.json { render :show, status: :created, location: @yemek_kategori }
      else
        format.html { render :new }
        format.json { render json: @yemek_kategori.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yemek_kategoris/1
  # PATCH/PUT /yemek_kategoris/1.json
  def update
    respond_to do |format|
      if @yemek_kategori.update(yemek_kategori_params)
        format.html { redirect_to yemek_kategoris_path, notice: 'Yemek kategori was successfully updated.' }
        format.json { render :show, status: :ok, location: @yemek_kategori }
      else
        format.html { render :edit }
        format.json { render json: @yemek_kategori.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yemek_kategoris/1
  # DELETE /yemek_kategoris/1.json
  def destroy
    @yemek_kategori.destroy
    respond_to do |format|
      format.html { redirect_to yemek_kategoris_url, notice: 'Yemek kategori was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yemek_kategori
      @yemek_kategori = YemekKategori.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yemek_kategori_params
      params.require(:yemek_kategori).permit(:isim)
    end
end

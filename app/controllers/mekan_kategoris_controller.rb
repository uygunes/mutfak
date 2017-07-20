class MekanKategorisController < ApplicationController
  before_action :set_mekan_kategori, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /mekan_kategoris
  def index
    @mekan_kategoris = MekanKategori.all
  end

  # GET /mekan_kategoris/1
  def show
  end

  # GET /mekan_kategoris/new
  def new
    @mekan_kategori = MekanKategori.new
  end

  # GET /mekan_kategoris/1/edit
  def edit
  end

  # POST /mekan_kategoris
  def create
    @mekan_kategori = MekanKategori.new(mekan_kategori_params)

    if @mekan_kategori.save
      redirect_to @mekan_kategori, notice: 'Mekan kategori was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mekan_kategoris/1
  def update
    if @mekan_kategori.update(mekan_kategori_params)
      redirect_to @mekan_kategori, notice: 'Mekan kategori was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mekan_kategoris/1
  def destroy
    @mekan_kategori.destroy
    redirect_to mekan_kategoris_url, notice: 'Mekan kategori was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mekan_kategori
      @mekan_kategori = MekanKategori.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mekan_kategori_params
      params.require(:mekan_kategori).permit(:isim)
    end
end

class MekanStoksController < ApplicationController
  before_action :set_mekan_stok, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /mekan_stoks
  def index
    @mekan_stoks = MekanStok.all
  end

  # GET /mekan_stoks/1
  def show
  end

  # GET /mekan_stoks/new
  def new
    @mekan_stok = MekanStok.new
  end

  # GET /mekan_stoks/1/edit
  def edit
  end

  # POST /mekan_stoks
  def create
    @mekan_stok = MekanStok.new(mekan_stok_params)

    if @mekan_stok.save
      redirect_to @mekan_stok, notice: 'Mekan stok was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mekan_stoks/1
  def update
    if @mekan_stok.update(mekan_stok_params)
      redirect_to @mekan_stok, notice: 'Mekan stok was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mekan_stoks/1
  def destroy
    @mekan_stok.destroy
    redirect_to mekan_stoks_url, notice: 'Mekan stok was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mekan_stok
      @mekan_stok = MekanStok.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mekan_stok_params
      params.require(:mekan_stok).permit(:mekan_id, :stok_id)
    end
end

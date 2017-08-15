class StokTakipsController < ApplicationController
  before_action :set_stok_takip, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /stok_takips
  def index
    @stok_takips = StokTakip.all
  end

  # GET /stok_takips/1
  def show
  end

  # GET /stok_takips/new
  def new
    @stok_takip = StokTakip.new
  end

  # GET /stok_takips/1/edit
  def edit
  end

  # POST /stok_takips
  def create
    @stok_takip = StokTakip.new(stok_takip_params)

    if @stok_takip.save
      redirect_to @stok_takip, notice: 'Stok takip was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stok_takips/1
  def update
    if @stok_takip.update(stok_takip_params)
      redirect_to @stok_takip, notice: 'Stok takip was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stok_takips/1
  def destroy
    @stok_takip.destroy
    redirect_to stok_takips_url, notice: 'Stok takip was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stok_takip
      @stok_takip = StokTakip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stok_takip_params
      params.require(:stok_takip).permit(:menu_id, :mekan_id, :siparis_formu_id, :teslimat_formu_id, :malzeme_id, :user_id, :miktar)
    end
end

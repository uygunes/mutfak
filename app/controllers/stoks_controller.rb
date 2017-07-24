class StoksController < ApplicationController
  before_action :set_stok, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /stoks
  def index
    @stoks = Stok.all
  end

  # GET /stoks/1
  def show
  end

  # GET /stoks/new
  def new
    @stok = Stok.new
  end

  # GET /stoks/1/edit
  def edit
  end

  # POST /stoks
  def create
    @stok = Stok.new(stok_params)

    if @stok.save
      redirect_to @stok, notice: 'Stok was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stoks/1
  def update
    if @stok.update(stok_params)
      redirect_to @stok, notice: 'Stok was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stoks/1
  def destroy
    @stok.destroy
    redirect_to stoks_url, notice: 'Stok was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stok
      @stok = Stok.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stok_params
      params.require(:stok).permit(:malzeme_id,:miktar)
    end
end

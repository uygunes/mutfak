class YemekUretimsController < ApplicationController
  before_action :set_yemek_uretim, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /yemek_uretims
  def index
    @yemek_uretims = YemekUretim.all
  end

  # GET /yemek_uretims/1
  def show
  end

  # GET /yemek_uretims/new
  def new
    @yemek_uretim = YemekUretim.new
  end

  # GET /yemek_uretims/1/edit
  def edit
  end
  


  # POST /yemek_uretims
  def create
    @yemek_uretim = YemekUretim.new(yemek_uretim_params)

    if @yemek_uretim.save
      redirect_to @yemek_uretim, notice: 'Yemek uretim was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /yemek_uretims/1
  def update
    if @yemek_uretim.update(yemek_uretim_params)
      redirect_to @yemek_uretim, notice: 'Yemek uretim was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /yemek_uretims/1
  def destroy
    @yemek_uretim.destroy
    redirect_to yemek_uretims_url, notice: 'Yemek uretim was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yemek_uretim
      @yemek_uretim = YemekUretim.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def yemek_uretim_params
      params.require(:yemek_uretim).permit(:yemek_id, :mekan_id, :menu_id, :miktar, :birim_id)
    end
end

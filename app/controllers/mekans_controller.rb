class MekansController < ApplicationController
  before_action :set_mekan, only: [:show, :edit, :update, :destroy,:get_restoran_oguns,:stok]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /mekans
  def index
    @mekans = Mekan.all
  end

  # GET /mekans/1
  def show
  end

  # GET /mekans/new
  def new
    @mekan = Mekan.new
  end

  # GET /mekans/1/edit
  def edit
  end

  def stok
  end

  def get_restoran_oguns
  
  result = []
  @mekan.oguns.each do |x| 
    result << {:id => x.id, :isim => "#{x.isim}" }
   end
  render :json => result.to_json
  end

  # POST /mekans
  def create
    @mekan = Mekan.new(mekan_params)

    if @mekan.save
      redirect_to mekans_path, notice: 'Mekan was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mekans/1
  def update
    if @mekan.update(mekan_params)
      redirect_to mekans_path, notice: 'Mekan was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mekans/1
  def destroy
    @mekan.destroy
    redirect_to mekans_url, notice: 'Mekan was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mekan
      @mekan = Mekan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mekan_params
      params.require(:mekan).permit(:isim, :mekan_kategori_id,mekan_oguns_attributes: [:id, :ogun_id, :_destroy])
    end
end

class MekansController < ApplicationController
  before_action :set_mekan, only: [:show, :edit, :update, :destroy,:get_restoran_oguns,:stok, :stok_giris]
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
  
  def stok_giris
    puts "bla bla"
    params[:mekan][:mekan_stoks_attributes].values.each do |item|
      puts item[:stok_id]
      puts item[:_destroy]
      mekan_stok = MekanStok.find_by(stok_id: item[:stok_id], mekan_id: @mekan.id )
      if item[:_destroy] == "1" && !mekan_stok.nil?
        puts "lagn"
       mekan_stok.destroy
        
      else
        
        if mekan_stok.nil?
        mekan_stok = MekanStok.new()
        
        stok = Stok.find_by_id(item[:stok_id])
        puts "#{item[:stok_id]} mk"
        puts stok.id
        mekan_stok.stok_id = stok.id
        mekan_stok.miktar = item[:miktar]
        mekan_stok.mekan_id = @mekan.id
        else
          if mekan_stok.miktar.to_i!= item[:miktar].to_i
           mekan_stok.miktar = mekan_stok.miktar.to_i + item[:miktar].to_i
          end
        end
        mekan_stok.save!
      end
      
      
   end
   redirect_to mekans_path, notice: 'Stok guncellendi.'
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
      params.require(:mekan).permit(:id, :isim, :mekan_kategori_id,mekan_oguns_attributes: [:id, :ogun_id, :_destroy], mekan_stoks_attributes: [:id, :miktar,:_destroy, :stok_id])
    end
end

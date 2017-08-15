class TeslimatFormusController < ApplicationController
  before_action :set_teslimat_formu, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /teslimat_formus
  def index
    @teslimat_formus = TeslimatFormu.all
  end

  # GET /teslimat_formus/1
  def show
  end
  
  def form
    @menu = Menu.find_by_id(params[:menu_id])
    @mekan = Mekan.find_by_id(params[:mekan_id])
    @malzemes = SiparisFormu.where(mekan_id:@mekan.id,menu_id:@menu.id,onay:true)
  end
  
    def kaydet
      menu = Menu.find_by_id(params[:teslimat_formu][:menu_id])
      mekan = Mekan.find_by_id(params[:teslimat_formu][:mekan_id])
    
    params[:teslimat_formu].each do |key, value| 
       if (key.start_with?("malzeme"))
         siparis = SiparisFormu.find_by(malzeme_id: key.split("_").last, menu_id: menu.id, mekan_id: mekan.id,onay:true )
         if !TeslimatFormu.find_by(malzeme_id: key.split("_").last, menu_id: menu.id, mekan_id: mekan.id,siparis_formu_id: siparis.id ).nil?
           teslimat = TeslimatFormu.find_by(malzeme_id: key.split("_").last, menu_id: menu.id, mekan_id: mekan.id )
           teslimat.miktar = value
          
         else
          teslimat = TeslimatFormu.new
          teslimat.mekan_id = mekan.id
          teslimat.menu_id = menu.id
          teslimat.malzeme_id = key.split("_").last
          teslimat.miktar = value
          teslimat.siparis_formu_id = siparis.id
          
         end
         teslimat.user_id = current_user.id
         teslimat.save!
         StokTakip.malzeme_stok_arttir(teslimat.id,siparis.id,menu.id,mekan.id,key.split("_").last,value,current_user.id)
       end
       
    end
    
    redirect_to menus_url, notice: 'Teslimat formu kaydedildi.'
  end
  

  # GET /teslimat_formus/new
  def new
    @teslimat_formu = TeslimatFormu.new
  end

  # GET /teslimat_formus/1/edit
  def edit
  end

  # POST /teslimat_formus
  def create
    @teslimat_formu = TeslimatFormu.new(teslimat_formu_params)

    if @teslimat_formu.save
      redirect_to @teslimat_formu, notice: 'Teslimat formu was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /teslimat_formus/1
  def update
    if @teslimat_formu.update(teslimat_formu_params)
      redirect_to @teslimat_formu, notice: 'Teslimat formu was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /teslimat_formus/1
  def destroy
    @teslimat_formu.destroy
    redirect_to teslimat_formus_url, notice: 'Teslimat formu was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teslimat_formu
      @teslimat_formu = TeslimatFormu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teslimat_formu_params
      params.require(:teslimat_formu).permit(:siparis_formu_id, :mekan_id, :miktar, :user_id)
    end
end

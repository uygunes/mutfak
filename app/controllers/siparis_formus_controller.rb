class SiparisFormusController < ApplicationController
  before_action :set_siparis_formu, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /siparis_formus
  def index
    @siparis_formus = SiparisFormu.group(:id,:menu_id).distinct.pluck(:menu_id)
  end
  
  def menu
    @menu = Menu.find_by_id(params[:id])
    @mekanlar = @menu.mekan_listesi_distinct(@menu.id)
  end
  
  def menu_mekan
    @menu = Menu.find_by_id(params[:menu_id])
    @mekan = Mekan.find_by_id(params[:mekan_id])
    @malzemeler = SiparisFormu.mekan_menu_siparis(@mekan.id,@menu.id)
  end

  # GET /siparis_formus/1
  def show
  end
  
  def form
    @menu = Menu.find_by_id(params[:menu_id])
    @mekan = Mekan.find_by_id(params[:mekan_id])
    @malzemes = @menu.mekan_malzeme_listesi(@mekan.id)
    
  end
  
  def kaydet
      menu = Menu.find_by_id(params[:siparis_formu][:menu_id])
      mekan = Mekan.find_by_id(params[:siparis_formu][:mekan_id])
    
    params[:siparis_formu].each do |key, value| 
       if (key.start_with?("malzeme"))
         if !SiparisFormu.find_by(malzeme_id: key.split("_").last, menu_id: menu.id, mekan_id: mekan.id ).nil?
           siparis = SiparisFormu.find_by(malzeme_id: key.split("_").last, menu_id: menu.id, mekan_id: mekan.id )
           siparis.miktar = value
          
         else
          siparis = SiparisFormu.new
          siparis.mekan_id = mekan.id
          siparis.menu_id = menu.id
          siparis.malzeme_id = key.split("_").last
          siparis.miktar = value
          
         end
         siparis.user_id = current_user.id
         siparis.save!
       end
    end
    redirect_to menus_url, notice: 'Siparis formu olusturuldu.'
  end
  
   def onayla
      menu = Menu.find_by_id(params[:siparis_formu][:menu_id])
      mekan = Mekan.find_by_id(params[:siparis_formu][:mekan_id])
    
    params[:siparis_formu].each do |key, value| 
       if (key.start_with?("malzeme"))
         if !SiparisFormu.find_by(malzeme_id: key.split("_").last, menu_id: menu.id, mekan_id: mekan.id ).nil?
           siparis = SiparisFormu.find_by(malzeme_id: key.split("_").last, menu_id: menu.id, mekan_id: mekan.id )
           siparis.miktar = value
           siparis.onay = true
           siparis.save
         else
          siparis = SiparisFormu.new
          siparis.mekan_id = mekan.id
          siparis.menu_id = menu.id
          siparis.malzeme_id = Malzeme.find_by_id(key.split("_").last).id
          siparis.miktar = value
          siparis.onay = true
          siparis.save!
         end
       end
    end
    redirect_to menus_url, notice: 'Siparis formu onaylandi.'
  end

  # GET /siparis_formus/new
  def new
    @siparis_formu = SiparisFormu.new
  end

  # GET /siparis_formus/1/edit
  def edit
  end

  # POST /siparis_formus
  def create
    @siparis_formu = SiparisFormu.new(siparis_formu_params)

    if @siparis_formu.save
      redirect_to @siparis_formu, notice: 'Siparis formu was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /siparis_formus/1
  def update
    if @siparis_formu.update(siparis_formu_params)
      redirect_to @siparis_formu, notice: 'Siparis formu was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /siparis_formus/1
  def destroy
    @siparis_formu.destroy
    redirect_to siparis_formus_url, notice: 'Siparis formu was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_siparis_formu
      @siparis_formu = SiparisFormu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def siparis_formu_params
      params.permit!
    end
end

class SiparisFormusController < ApplicationController
  before_action :set_siparis_formu, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /siparis_formus
  def index
    @siparis_formus = SiparisFormu.all
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
      
      puts menu
      puts mekan
    params[:siparis_formu].each do |key, value| 
    puts key
    puts value
       if (key.start_with?("malzeme"))
 
          siparis = SiparisFormu.new
          siparis.mekan_id = mekan.id
          siparis.menu_id = menu.id
          siparis.malzeme_id = key.split("_").last
          siparis.miktar = value
          siparis.save!
       end
    end
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

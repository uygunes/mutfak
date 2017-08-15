class MenusController < ApplicationController
  require 'amoeba'
  before_action :set_menu, only: [:show, :edit, :update, :destroy, :aktif, :uretim,:artan, :teslimat]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
    @menuYemek = MenuYemek.where(:menu_id => @menu.id)
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  def aktif
    @menu.update(is_active: true)
    @menu.save
    render :aktif
  end
  
  def uretim
    render :uretim
  end
  
  def artan
    render :artan
  end

  # GET /menus/1/edit
  def edit
  end
  
  def uretim_kayit
        menu = Menu.find_by_id(params[:yemek_uretim][:menu_id])
     
    params[:yemek_uretim].each do |key, value| 
        puts "buraya giriyor mu?"
       if (key.start_with?("yemek"))
         yemek = Yemek.find_by(id: key.split("_").last)
        
        # birim = Birim.find_by_id(params[:yemek_uretim]["birim_#{yemek.id}"])
         if !YemekUretim.find_by(yemek_id: yemek.id, menu_id: menu.id, mekan_id: yemek.mekan.id ).nil?
           yemek_uretim = YemekUretim.find_by(yemek_id: key.split("_").last, menu_id: menu.id, mekan_id: yemek.mekan.id )
           yemek_uretim.miktar = params[:yemek_uretim]["miktar_#{yemek.id}"]
           yemek_uretim.birim_id = params[:yemek_uretim][:"birim_#{yemek.id}"]
           puts params[:yemek_uretim][:"birim_#{yemek.id}"]
         else
          yemek_uretim = YemekUretim.new
          yemek_uretim.mekan_id = yemek.mekan.id
          yemek_uretim.menu_id = menu.id
          yemek_uretim.birim_id =params[:yemek_uretim][:"birim_#{yemek.id}"]
          yemek_uretim.yemek_id = key.split("_").last
          yemek_uretim.miktar = params[:yemek_uretim]["miktar_#{yemek.id}"]
          yemek_uretim.tip = "uretim"
         end
          yemek_uretim.save
          puts "buraya girmiyor?"
          StokTakip.malzeme_stok_azalt(yemek.mekan.id,menu.id,current_user.id)
       end
    end
    redirect_to menus_path, notice: 'Yemek uretimi girildi.'
  end
  
   def artan_kayit
        menu = Menu.find_by_id(params[:yemek_uretim][:menu_id])
     
    params[:yemek_uretim].each do |key, value| 
        
       if (key.start_with?("yemek"))
         yemek = Yemek.find_by(id: key.split("_").last)
        
        # birim = Birim.find_by_id(params[:yemek_uretim]["birim_#{yemek.id}"])
         if !YemekUretim.find_by(yemek_id: yemek.id, menu_id: menu.id, mekan_id: yemek.mekan.id ).nil?
           yemek_uretim = YemekUretim.find_by(yemek_id: key.split("_").last, menu_id: menu.id, mekan_id: yemek.mekan.id )
           yemek_uretim.miktar = params[:yemek_uretim]["miktar_#{yemek.id}"]
           yemek_uretim.birim_id = params[:yemek_uretim][:"birim_#{yemek.id}"]
           puts params[:yemek_uretim][:"birim_#{yemek.id}"]
         else
          yemek_uretim = YemekUretim.new
          yemek_uretim.mekan_id = yemek.mekan.id
          yemek_uretim.menu_id = menu.id
          yemek_uretim.birim_id =params[:yemek_uretim][:"birim_#{yemek.id}"]
          yemek_uretim.yemek_id = key.split("_").last
          yemek_uretim.miktar = params[:yemek_uretim]["miktar_#{yemek.id}"]
          yemek_uretim.tip = "artan"
         end
          yemek_uretim.save!
       end
    end
    redirect_to menus_path, notice: 'Yemek uretimi girildi.'
  end

  def kopyala
    ex =Menu.find_by_id(params[:id])
    exMenu = ex.kopyala
    exMenu.update(isim: "#{ex.isim} - kopya")
    exMenu.update(tarih: "1970-01-01")
    exMenu.save
    respond_to do |format|
      format.html { redirect_to menus_path, notice: 'Menu kopyalandi.' }
    end
  end

  # POST /menus
  # POST /menus.json
  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_path, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    respond_to do |format|
       puts @menu.errors.full_messages
      if @menu.update(menu_params)
        format.html { redirect_to menus_path, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        puts @menu.errors.full_messages
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:id, :isim,:kisi,:tarih,:ogun_id,:mekan_id,:is_active, menu_yemeks_attributes: [:id, :yemek_id, :kisi, :_destroy])
    end
end

class MenusController < ApplicationController
  require 'amoeba'
  before_action :set_menu, only: [:show, :edit, :update, :destroy, :aktif]

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

  # GET /menus/1/edit
  def edit
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

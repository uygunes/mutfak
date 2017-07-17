class RestoranYonetimsController < ApplicationController
  
  # GET /restoran_yonetims
  # GET /restoran_yonetims.json
  def index

    tarih = params[:tarih]
    restoran_id = params[:restoran_id]

    if  (!tarih.nil? && !restoran_id.nil?) && (!tarih.empty? && !restoran_id.empty?)
    @result = tarih_verestoran(tarih,restoran_id).all
       
    end
    
    if tarih.nil? || tarih.empty?
    @result = restoran_ara(restoran_id)
    end


    if restoran_id.nil? || restoran_id.empty?
    @result = search(tarih).all
    end
  
  end

  # GET /restoran_yonetims/1
  # GET /restoran_yonetims/1.json
  def show
  end

  def create

  end

  # GET /restoran_yonetims/new
  def new
    @restoran_yonetim = RestoranYonetim.new
  end

  # GET /restoran_yonetims/1/edit
  def edit
  end

  def search(tarih)
    Restoran.joins(:menus).where(:menus =>{:tarih => tarih})
  end

  def restoran_ara(sid)
    Restoran.find_by_id(sid)
  end

  def tarih_verestoran(tarih,restoran_id)
    Restoran.where(:id => restoran_id).joins(:menus).where(:menus =>{:tarih => tarih})
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restoran_yonetim
      @restoran_yonetim = RestoranYonetim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restoran_yonetim_params
      params.fetch(:restoran_yonetim, {}).permit(:tarih,:restoran_id)
    end
end

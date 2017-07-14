class MalzemeKategorisController < ApplicationController
  before_action :set_malzeme_kategori, only: [:show, :edit, :update, :destroy]

  # GET /malzeme_kategoris
  # GET /malzeme_kategoris.json
  def index
    @malzeme_kategoris = MalzemeKategori.all
  end

  # GET /malzeme_kategoris/1
  # GET /malzeme_kategoris/1.json
  def show
  end

  # GET /malzeme_kategoris/new
  def new
    @malzeme_kategori = MalzemeKategori.new
  end

  # GET /malzeme_kategoris/1/edit
  def edit
  end

  # POST /malzeme_kategoris
  # POST /malzeme_kategoris.json
  def create
    @malzeme_kategori = MalzemeKategori.new(malzeme_kategori_params)

    respond_to do |format|
      if @malzeme_kategori.save!
        format.html { redirect_to @malzeme_kategori, notice: 'Malzeme kategori was successfully created.' }
        format.json { render :show, status: :created, location: @malzeme_kategori }
      else
        format.html { render :new }
        format.json { render json: @malzeme_kategori.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /malzeme_kategoris/1
  # PATCH/PUT /malzeme_kategoris/1.json
  def update
    respond_to do |format|
      if @malzeme_kategori.update(malzeme_kategori_params)
        format.html { redirect_to @malzeme_kategori, notice: 'Malzeme kategori was successfully updated.' }
        format.json { render :show, status: :ok, location: @malzeme_kategori }
      else
        format.html { render :edit }
        format.json { render json: @malzeme_kategori.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /malzeme_kategoris/1
  # DELETE /malzeme_kategoris/1.json
  def destroy
    @malzeme_kategori.destroy
    respond_to do |format|
      format.html { redirect_to malzeme_kategoris_url, notice: 'Malzeme kategori was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_malzeme_kategori
      @malzeme_kategori = MalzemeKategori.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def malzeme_kategori_params
      params.require(:malzeme_kategori).permit(:isim)
    end
end

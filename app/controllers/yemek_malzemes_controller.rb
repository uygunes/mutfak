class YemekMalzemesController < ApplicationController
  before_action :set_yemek_malzeme, only: [:show, :edit, :update, :destroy]

  # GET /yemek_malzemes
  # GET /yemek_malzemes.json
  def index
    @yemek_malzemes = YemekMalzeme.all
  end

  # GET /yemek_malzemes/1
  # GET /yemek_malzemes/1.json
  def show
  end

  # GET /yemek_malzemes/new
  def new
    @yemek_malzeme = YemekMalzeme.new
  end

  # GET /yemek_malzemes/1/edit
  def edit
  end

  # POST /yemek_malzemes
  # POST /yemek_malzemes.json
  def create
    @yemek_malzeme = YemekMalzeme.new(yemek_malzeme_params)

    respond_to do |format|
      if @yemek_malzeme.save
        format.html { redirect_to @yemek_malzeme, notice: 'Yemek malzeme was successfully created.' }
        format.json { render :show, status: :created, location: @yemek_malzeme }
      else
        format.html { render :new }
        format.json { render json: @yemek_malzeme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yemek_malzemes/1
  # PATCH/PUT /yemek_malzemes/1.json
  def update
    respond_to do |format|
      if @yemek_malzeme.update(yemek_malzeme_params)
        format.html { redirect_to @yemek_malzeme, notice: 'Yemek malzeme was successfully updated.' }
        format.json { render :show, status: :ok, location: @yemek_malzeme }
      else
        format.html { render :edit }
        format.json { render json: @yemek_malzeme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yemek_malzemes/1
  # DELETE /yemek_malzemes/1.json
  def destroy
    @yemek_malzeme.destroy
    respond_to do |format|
      format.html { redirect_to yemek_malzemes_url, notice: 'Yemek malzeme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yemek_malzeme
      @yemek_malzeme = YemekMalzeme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yemek_malzeme_params
      params.fetch(:yemek_malzeme, {})
    end
end

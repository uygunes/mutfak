class BirimsController < ApplicationController
  before_action :set_birim, only: [:show, :edit, :update, :destroy]

  # GET /birims
  # GET /birims.json
  def index
    @birims = Birim.all
  end

  # GET /birims/1
  # GET /birims/1.json
  def show
  end

  # GET /birims/new
  def new
    @birim = Birim.new
  end

  # GET /birims/1/edit
  def edit
  end

  # POST /birims
  # POST /birims.json
  def create
    @birim = Birim.new(birim_params)

    respond_to do |format|
      if @birim.save
        format.html { redirect_to birims_path, notice: 'Birim was successfully created.' }
        format.json { render :show, status: :created, location: @birim }
      else
        format.html { render :new }
        format.json { render json: @birim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /birims/1
  # PATCH/PUT /birims/1.json
  def update
    respond_to do |format|
      if @birim.update(birim_params)
        format.html { redirect_to birims_path, notice: 'Birim was successfully updated.' }
        format.json { render :show, status: :ok, location: @birim }
      else
        format.html { render :edit }
        format.json { render json: @birim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /birims/1
  # DELETE /birims/1.json
  def destroy
    @birim.destroy
    respond_to do |format|
      format.html { redirect_to birims_url, notice: 'Birim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_birim
      @birim = Birim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def birim_params
      params.require(:birim).permit(:isim)
    end
end

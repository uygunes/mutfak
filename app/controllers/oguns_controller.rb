class OgunsController < ApplicationController
  before_action :set_ogun, only: [:show, :edit, :update, :destroy]

  # GET /oguns
  # GET /oguns.json
  def index
    @oguns = Ogun.all
  end

  # GET /oguns/1
  # GET /oguns/1.json
  def show
  end

  # GET /oguns/new
  def new
    @ogun = Ogun.new
  end

  # GET /oguns/1/edit
  def edit
  end

  # POST /oguns
  # POST /oguns.json
  def create
    @ogun = Ogun.new(ogun_params)

    respond_to do |format|
      if @ogun.save
        format.html { redirect_to @ogun, notice: 'Ogun was successfully created.' }
        format.json { render :show, status: :created, location: @ogun }
      else
        format.html { render :new }
        format.json { render json: @ogun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oguns/1
  # PATCH/PUT /oguns/1.json
  def update
    respond_to do |format|
      if @ogun.update(ogun_params)
        format.html { redirect_to @ogun, notice: 'Ogun was successfully updated.' }
        format.json { render :show, status: :ok, location: @ogun }
      else
        format.html { render :edit }
        format.json { render json: @ogun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oguns/1
  # DELETE /oguns/1.json
  def destroy
    @ogun.destroy
    respond_to do |format|
      format.html { redirect_to oguns_url, notice: 'Ogun was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ogun
      @ogun = Ogun.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ogun_params
      params.require(:ogun).permit(:isim, :baslangic, :bitis)
    end
end

class MalzemesController < ApplicationController
  before_action :set_malzeme, only: [:show, :edit, :update, :destroy]

  # GET /malzemes
  # GET /malzemes.json
  def index
    @malzemes = Malzeme.all
  end

  # GET /malzemes/1
  # GET /malzemes/1.json
  def show
  end

  # GET /malzemes/new
  def new
    @malzeme = Malzeme.new
  end

  # GET /malzemes/1/edit
  def edit
  end

  # POST /malzemes
  # POST /malzemes.json
  def create
    @malzeme = Malzeme.new(malzeme_params)

    respond_to do |format|
      if @malzeme.save
        format.html { redirect_to malzemes_path, notice: 'Malzeme was successfully created.' }
        format.json { render :show, status: :created, location: @malzeme }
      else
        format.html { render :new }
        format.json { render json: @malzeme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /malzemes/1
  # PATCH/PUT /malzemes/1.json
  def update
    respond_to do |format|
      if @malzeme.update(malzeme_params)
        format.html { redirect_to malzemes_path, notice: 'Malzeme was successfully updated.' }
        format.json { render :show, status: :ok, location: @malzeme }
      else
        format.html { render :edit }
        format.json { render json: @malzeme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /malzemes/1
  # DELETE /malzemes/1.json
  def destroy
    @malzeme.destroy
    respond_to do |format|
      format.html { redirect_to malzemes_url, notice: 'Malzeme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_malzeme
      @malzeme = Malzeme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def malzeme_params
      params.fetch(:malzeme, {}).permit(:isim,:fiyat,:birim_id,:malzeme_kategori_id);
    end
end

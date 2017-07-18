class TakvimsController < ApplicationController
  before_action :set_takvim, only: [:show, :edit, :update, :destroy]

def view
    @github = Github.new
    @github.repos.releases.list 'uygunes', 'mutfak'
    render "version"
  end

def get_events_full
    @rest = Restoran.all
    events = []
    @rest.each do |rest|
      rest.oguns.each do |task|
        task.menus.each do |menu|
        events << {:id => task.id, :title => "#{task.isim}",:start => "#{menu.tarih} #{task.baslangic.strftime("%H:%M:%S")}",:end => "#{menu.tarih} #{task.bitis.strftime("%H:%M:%S")}" }
        end
      end
    end
      render :json => events.to_json
 end
 
 def get_events
  
   @oguns = @restoran.oguns.all
    events = []
      @oguns.each do |task|
        task.menus.each do |menu|
        events << {:id => task.id, :title => "#{task.isim}",:start => "#{menu.tarih} #{task.baslangic.strftime("%H:%M:%S")}",:end => "#{menu.tarih} #{task.bitis.strftime("%H:%M:%S")}" }
        end
      end
      render :json => events.to_json
 end

def full
render "index"
  
end

  # GET /takvims
  # GET /takvims.json
  def index
    
  end

  # GET /takvims/1
  # GET /takvims/1.json
  def show
  end

  # GET /takvims/new
  def new
    @takvim = Takvim.new
  end

  # GET /takvims/1/edit
  def edit
  end

  # POST /takvims
  # POST /takvims.json
  def create
    @takvim = Takvim.new(takvim_params)

    respond_to do |format|
      if @takvim.save
        format.html { redirect_to @takvim, notice: 'Takvim was successfully created.' }
        format.json { render :show, status: :created, location: @takvim }
      else
        format.html { render :new }
        format.json { render json: @takvim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /takvims/1
  # PATCH/PUT /takvims/1.json
  def update
    respond_to do |format|
      if @takvim.update(takvim_params)
        format.html { redirect_to @takvim, notice: 'Takvim was successfully updated.' }
        format.json { render :show, status: :ok, location: @takvim }
      else
        format.html { render :edit }
        format.json { render json: @takvim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /takvims/1
  # DELETE /takvims/1.json
  def destroy
    @takvim.destroy
    respond_to do |format|
      format.html { redirect_to takvims_url, notice: 'Takvim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_takvim
      
      @restoran = Restoran.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def takvim_params
      params.fetch(:takvim, {}).permit(:id)
    end
end

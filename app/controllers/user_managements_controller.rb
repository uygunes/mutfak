class UserManagementsController < ApplicationController
	protect_from_forgery prepend: true, with: :exception
	before_action :set_user, only: [:show, :edit, :update, :destroy, :aktif]

	def index
		@users = User.all

	end
	def create
		 @user = User.new(user_params)

	    respond_to do |format|
	      if @user.save
	        format.html { redirect_to user_management_path, notice: 'User was successfully created.' }
	        format.json { render :show, status: :created, location: @user }
	      else
	        format.html { render :new }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def edit
	end

	def show
	end

	def new
		@user = User.new
	end

	def destroy
	end

	def update
		 respond_to do |format|
      
	      if @user.update(user_params)
	        format.html { redirect_to user_management_path, notice: 'User was successfully updated.' }
	        format.json { render :show, status: :ok, location: @user }
	      else
	       
	        format.html { render :edit }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
    	end
	end

	 private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :isim,:password,:password_confirmation,:mekan_id,:roles,:email)
    end
end

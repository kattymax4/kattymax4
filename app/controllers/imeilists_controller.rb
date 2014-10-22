class ImeilistsController < ApplicationController
  before_filter :authenticate_user!
  def new
  	@imeilist = Imeilist.new;
  end

  def create
  	@imeilist = Imeilist.new(params[:imeilist])
  	if(@imeilist.save!)
  		redirect_to imeilists_path, :success => "IMEI number added successfully."
  	end
  end

  def index
		@imeilist = Imeilist.where(["user_id = ?", current_user.id])
  end

  def destroy
  	Imeilist.destroy(params[:id])
  	redirect_to imeilists_path
  end
end

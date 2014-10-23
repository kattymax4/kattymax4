class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :checkcreate, :showallmessagesnow, :showallusersnow]
  def index
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end
  def showallmessagesnow
    @messages = Message.all
  end
  def showallusersnow
    @user = User.all
  end
  def checkcreate
    @message = Message.new
    sms_from = params['sms_from']
    sms_body = params['sms_body']


    sms_from = sms_from.gsub("\"",'') 
    sms_body = sms_body.gsub("\"",'')

     arr = sms_from.split(' ')
     len = arr.length 
     @message.imei = arr[0].to_s
     @message.number = arr[1].to_s
     @message.name = ""
    i = 2 

    while i < len-2 
      @message.name=@message.name+ arr[i] 
      i = i +1 
    end 
    @message.date = arr[len-2].to_s+" "+arr[len-1].to_s 
    @message.body = sms_body
    @message.save!


  end 

  def update
  	@user = User.find(params[:id])
    # @component.description = params[:description]
    # @component.name = params[:name]
    # @component.save!
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_path, success: 'User was successfully updated.' }
        format.json { head :no_content }
      end
    end
  end
end

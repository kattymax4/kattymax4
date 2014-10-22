class MessagesController < ApplicationController

	def index
		@thread = Imeilist.where(["user_id = ?", current_user.id]).pluck(:imei)
		@t = Imeilist.where(["user_id = ?", current_user.id])
		#@thread = Imeilist.find(:all,:select => 'imei', :conditions => { user_id = current_user } )
		@messages = Message.where(:imei => @thread)
	

		#Client.where(:orders_count => [1,3,5])
		# @thread = Imeilist.where(user_id: current_user)
		# @thread_ids = Imeilist.where(user_id: current_user).pluck(:id)
		
		# @messages = Message.where(imei: @thread_ids)
	end

	def show
		@message = Message.find(params[:id])
	end

	def changed
		# return render json: params[:imei]
		begin
			if params[:imei].to_i
		@t = Imeilist.where(["user_id = ?", current_user.id])
		if params[:imei].present?
			@messages = Message.where(imei: params[:imei])
		else
			@thread = Imeilist.where(["user_id = ?", current_user.id]).pluck(:imei)
			@messages = Message.where(:imei => @thread)
		end
	end
		rescue Exception  => e

		end
	end

	def strange
		
		
	end

end
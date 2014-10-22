class Message < ActiveRecord::Base
  attr_accessible :date, :imei, :name, :number, :body
end

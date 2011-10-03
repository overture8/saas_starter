class Account < ActiveRecord::Base
  has_many :contexts
  has_many :users, :through => :contexts
  attr_accessor :card_no, :card_cvc, :card_expiry_month, :card_expiry_year
end

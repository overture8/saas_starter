class Account < ActiveRecord::Base
  has_many :users, :through => :contexts
end

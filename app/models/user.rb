class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :account_name, :plan
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :account_name, :first_name, :last_name, :plan

  has_many :contexts
  has_many :accounts, :through => :contexts

  before_save :create_related_account

  private

  def create_related_account
    if self.account_name && self.plan
      customer = Stripe::Customer.create(:email => self.email, :plan => self.plan)
      self.accounts.build(:name => self.account_name, :owner_id => self.id, :plan => self.plan, :customer_ref => customer.id)
    end
  end
end

class Plan < ActiveRecord::Base
  validates_presence_of :name, :currency, :interval, :amount
  after_save :create_stripe_plan

  private

  def create_stripe_plan
    Stripe::Plan.create(
      :amount => self.amount,
      :interval => self.interval,
      :name => self.name,
      :currency => self.currency,
      :trial_period_days => self.trial_period_days,
      :id => create_id(self.name)
    )
  end

  def create_id(str)
    str.downcase.gsub(/[^a-z0-9]+/i, '-')
  end
end

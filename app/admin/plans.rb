ActiveAdmin.register Plan do
  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :interval, :as => :select, :collection => [['Monthly', 'month'], ['Weekly', 'week'], ['Yearly', 'year']]
      f.input :currency, :as => :select, :collection => [['USD', 'usd']]
      f.input :amount, :hint => "Format e.g. 12.00"
      f.input :trial_period_days
      f.buttons
    end
  end
end

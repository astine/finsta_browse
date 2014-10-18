class Company < ActiveRecord::Base

  has_many :closing_prices
  has_many :reports
end

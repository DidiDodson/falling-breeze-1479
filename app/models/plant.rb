class Plant < ApplicationRecord
  has_many :plot_plants
  has_many :plots, through: :plot_plants

  def self.under_100
    self.distinct.where("days_to_harvest < 100")
  end
end

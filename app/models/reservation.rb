class Reservation < ApplicationRecord
  belongs_to :user

  def multiple_days?
    [attending_friday, attending_saturday, attending_sunday].map(&:to_s).tally['true'].to_i > 0
  end

  def party_size
    [guests_adults, guests_children, 1].map(&:to_i).sum
  end
end

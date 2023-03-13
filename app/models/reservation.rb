class Reservation < ApplicationRecord
  belongs_to :user

  def unstarted?
    first_name.blank?
  end

  def multiple_days?
    [attending_friday, attending_saturday, attending_sunday].map(&:to_s).tally['true'].to_i > 0
  end

  def cabin_own_linens_discrete?
    cabin_own_linens == 'none' || cabin_own_linens == 'all'
  end

  def cabin_own_linens_display_value
    if cabin_own_linens_discrete?
      ''
    else
      cabin_own_linens
    end
  end

  def party_size
    [guests_adults, guests_children, 1].map(&:to_i).sum
  end
end

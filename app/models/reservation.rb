class Reservation < ApplicationRecord
  belongs_to :user

  def unstarted?
    first_name.blank?
  end

  def multiple_days?
    [attending_friday, attending_saturday, attending_sunday].map(&:to_s).tally['true'].to_i > 0
  end

  def cabin_own_linens_discrete?
    cabin_own_linens == 'no' || cabin_own_linens == 'all'
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

  def activity_preferences
    {
      activity_preference_paint_night: { name: 'Paint Night', position: activity_preference_paint_night},
      activity_preference_archery: { name: 'Archery', position: activity_preference_archery},
      activity_preference_climbing_wall: { name: 'Climbing Wall', position: activity_preference_climbing_wall},
      activity_preference_gokarts: { name: 'Go-karts', position: activity_preference_gokarts},
      activity_preference_slipnslide: { name: 'Slip-n-slide', position: activity_preference_slipnslide},
      activity_preference_swimming_pool: { name: 'Swimming Pool', position: activity_preference_swimming_pool},
      activity_preference_zipline: { name: 'Zip-line', position: activity_preference_zipline}
    }.sort_by{|k,v| v[:position]}
  end

  def swap_activity_positions(old, changed)
    activity_preferences.each do |activity|
      key, values = activity
      if values[:position] == old
        self[key] = changed
        self.save
      elsif values[:position] == changed
        self[key] = old
        self.save
      end
    end
  end
end

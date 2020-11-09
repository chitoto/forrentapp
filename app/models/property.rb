class Property < ApplicationRecord
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: :reject_stations_blank, allow_destroy: true

  def reject_stations_blank(attributes)
      attributes.merge!(_destroy: "1") if attributes[:routes_name].blank? && attributes[:station_name].blank? && attributes[:minutes_on_foot].blank?
  end
end

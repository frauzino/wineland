module RetailersHelper
  def retailers_for_region_to_hash(region)
    cities_for_region = Retailer.where(region: region).distinct.pluck(:city)

    cities_for_region.map do |city|
      retailers_for_city = Retailer.where(region: region, city: city)
      { header: city,
        content: retailers_for_city.map { |retailer| "#{retailer.name} - #{retailer.address}" }.join('<br>') }
    end
  end
end

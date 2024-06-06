module RetailersHelper
  def retailers_for_region_to_hash(region)
    Retailer.where(region: region).map do |retailer|
      { header: retailer.city,
        content: "#{retailer.name} - #{retailer.address}"}
    end
  end
end

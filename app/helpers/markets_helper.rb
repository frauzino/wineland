module MarketsHelper
  def markets_to_hash(markets)
    markets.map do |market|
      { header: market.name,
        content: market.description,
        date: market.start_date_time.strftime('%b %d, %Y') }
    end
  end
end

module ProductsHelper

  def price_display(price)
    return "N/A" if price.blank?
    price
  end
end

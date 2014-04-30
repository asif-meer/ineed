class Category < ActiveRecord::Base
  has_ancestry
  has_many :products, :through => :categorizations

  def self.viewable_categories
    where.not(:name => "products")
  end
end

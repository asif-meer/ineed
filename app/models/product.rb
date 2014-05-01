class Product < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations
  belongs_to :user

  def added_categories
    self.categories.map(&:name).join(",")
  end

  def to_s
    "#{self.name}"
  end

end

class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  
  DEFAULT_ROLE = "patient"
  PUBLIC_ROLES  = ["patient", "physician"]

  validates :name, presence: true
  scopify
end

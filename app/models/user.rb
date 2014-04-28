class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products

  def admin?
    self.has_role? :superadmin
  end

  def to_s
    "#{self.first_name}"
  end

  def fullname
    "#{self.to_s}"
  end

  def set_role(role)
    usr_role = Role::PUBLIC_ROLES.include?(role) ? role : Role::DEFAULT_ROLE
    self.add_role usr_role
  end

end

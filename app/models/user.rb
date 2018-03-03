class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :calendars, dependent: :destroy

  after_create :assign_default_role

  def assign_default_role
    if self.id == 1 then
      puts "This is the first user... they should be automatically made an admin..."
      self.add_role(:admin)
    end

    self.add_role(:manager) if self.roles.blank?
  end
end

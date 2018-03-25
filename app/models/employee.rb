class Employee < ApplicationRecord
  belongs_to :calendar
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates_uniqueness_of :email, :scope => [:calendar_id]
  store_accessor :weekly_preferences, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday

  def set_preferences(preferred_shifts)
    preferred_shifts.each do |k, v|
      k.downcase

      if k.include? "mon"
        self.weekly_preferences[:monday].push(v)
      elsif k.include? "tues"
        self.weekly_preferences[:tuesday].push(v)
      elsif k.include? "wed"
        self.weekly_preferences[:wednesday].push(v)
      elsif k.include? "thurs"
        self.weekly_preferences[:thursday].push(v)
      elsif k.include? "fri"
        self.weekly_preferences[:friday].push(v)
      elsif k.include? "sat"
        self.weekly_preferences[:saturday].push(v)
      elsif k.include? "sun"
        self.weekly_preferences[:sunday].push(v)
      else
        #What to do if preferred shifts has none of these
      end
    end

    self.save
  end

end

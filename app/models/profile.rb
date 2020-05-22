class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_or_last
  validates :gender, inclusion: %w(male female) 
  validate :no_man_sue

  def first_or_last
  	if first_name == nil and last_name== nil
  		errors.add(:last_name,"must have first anad last name")
	end
end



def no_man_sue
	if gender == "male" and first_name == "Sue"
		errors.add(:first_name, "cant have a man named Sue")
	end
end


def self.get_all_profiles(min,max)
return Profile.where("birth_year BETWEEN :min AND :max", min: min, max: max).order(:birth_year)

end


end




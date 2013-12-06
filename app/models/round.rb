class Round < ActiveRecord::Base
	
	belongs_to :users
	belongs_to :courses

	validates_presence_of :score, :winnings, :course_id, :user_id

end

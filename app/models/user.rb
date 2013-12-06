class User < ActiveRecord::Base
	has_secure_password
	has_many :rounds
	has_many :courses, :through => :rounds

	validates_presence_of :first_name, :last_name, :email, :password
	validates_uniqueness_of :email
	validates :email, :format => {:with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}
	validates :password, :length => {:minimum => 5}


	def full_name
		self.first_name + " " + self.last_name
	end

	def winnings
		self.rounds.pluck(:winnings)
	end

	def net_winnings
		# calculate net money gained 
		self.winnings.reduce(:+)
	end

	def rounds_played
		# total rounds played
		self.rounds.count
	end

	def worst_loss
		# show round with most money lost
		self.winnings.min
	end

	def biggest_win
		# show round with most money won
		self.winnings.max
	end

	def avg_winnings_per_round
		# calculate total winnings / rounds played
		self.net_winnings / self.rounds_played
	end

	def avg_win
		# averge amount of money you win, when you win money
		gains = self.winnings.map { |i| i > 0 }
		gains.reduce(:+) / gains.count
	end

	def avg_loss
		# average amount of money you lose, when you lose money
		losses = self.winnings.map { |i| i < 0 }
		losses.reduce(:+) / losses.count		
	end

	def status
		# determined by consecutive rounds of either winning or loosing money
		# types: ice_cold, cold, steady, warming up, hide your wallets
	end

end

class AddColumnsToCourseTable < ActiveRecord::Migration
  def change
  	add_column :courses, :rating, :float
  	add_column :courses, :slope, :integer
  end
end

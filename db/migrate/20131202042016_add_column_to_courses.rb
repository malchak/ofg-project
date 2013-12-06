class AddColumnToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :tee, :string
  end
end

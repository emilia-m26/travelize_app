class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :title
      t.integer :traveler_id
    end 
  end
end

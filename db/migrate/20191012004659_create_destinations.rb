class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :place
      t.boolean :complete, default: false
      t.integer :goal_id
    end
  end
end
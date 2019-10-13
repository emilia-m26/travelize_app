class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :place
      t.boolean :complete, default: false
    end
  end
end
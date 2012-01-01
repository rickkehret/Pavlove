class CreateInspirations < ActiveRecord::Migration
  def change
    create_table :inspirations do |t|
      t.string :body
      t.string :author

      t.timestamps
    end
  end
end

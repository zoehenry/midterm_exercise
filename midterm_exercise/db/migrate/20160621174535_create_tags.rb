class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :time
      t.string :body_part
      t.integer :exercise_id

      t.timestamps null: false
    end
  end
end

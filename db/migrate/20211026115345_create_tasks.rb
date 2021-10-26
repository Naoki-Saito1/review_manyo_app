class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.date :limit
      t.integer :status
      t.integer :priority
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

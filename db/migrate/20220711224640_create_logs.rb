class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.string :title
      t.integer :user_id
      t.text :desc

      t.timestamps
    end
  end
end

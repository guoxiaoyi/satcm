class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :logo
      t.string :tel
      t.string :address
      t.string :qrcode
      t.string :oa_path
      t.string :title
      t.string :description
      t.string :keywords


      t.timestamps
    end
  end
end

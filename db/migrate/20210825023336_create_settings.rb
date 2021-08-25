class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :logo
      t.string :tel
      t.string :address
      t.string :qrcode
      t.string :banner_a
      t.string :banner_b
      t.string :banner_a_link
      t.string :banner_b_link
      t.string :oa_path

      t.timestamps
    end
  end
end

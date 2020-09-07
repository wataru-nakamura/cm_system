class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string  :family_name,       null:false
      t.string  :first_name,        null:false
      t.string  :family_name_kana,  null:false
      t.string  :first_name_kana,   null:false
      t.date    :birthday,          null:false
      t.string  :gender,            null:false
      t.integer :age,               null:false
      t.string  :postal_code,       null:false
      t.string  :address,           null:false
      t.string  :building_name
      t.string  :phone_number,      null:false
      t.string  :email
      t.timestamps
    end
  end
end

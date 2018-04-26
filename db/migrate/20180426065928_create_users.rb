class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, full: false, unique: true
      t.string :email, full: false, unique: true

      t.timestamps
    end
  end
end

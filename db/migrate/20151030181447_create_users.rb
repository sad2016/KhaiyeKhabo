class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :role, index: true, foreign_key: true
      t.string :username
      t.string :fullname
      t.date :datebirth
      t.string :occupation
      t.string :otherinterest
      t.references :cookcategory, index: true, foreign_key: true
      t.string :favcookbook
      t.string :location
      t.string :picture
      t.boolean :isbanned, default: false

      t.timestamps null: false
    end
  end
end

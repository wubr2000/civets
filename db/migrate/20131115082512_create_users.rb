class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, uniqueness: true 
      t.string :salt
      t.string :fish
      t.string :code, index: true
      t.timestamp :expires_at

      t.timestamps
    end
  end
end

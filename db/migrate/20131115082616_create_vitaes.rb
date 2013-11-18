class CreateVitaes < ActiveRecord::Migration
  def change
    create_table :vitaes do |t|
      t.string :name
      t.string :objective
      t.string :code, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

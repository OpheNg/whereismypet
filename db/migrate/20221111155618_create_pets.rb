class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :specie
      t.string :breed
      t.string :color
      t.string :age
      t.string :email
      t.string :tel
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.date :event_date
      t.text :details
      t.string :status

      t.timestamps
    end
  end
end

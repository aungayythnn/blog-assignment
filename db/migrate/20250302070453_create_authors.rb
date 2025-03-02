class CreateAuthors < ActiveRecord::Migration[8.0]
  def change
    create_table :authors do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password

      t.timestamps
    end

    add_index :authors, :username, unique: true
    add_index :authors, :email, unique: true
  end
end

class CreatePartyGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :party_guests do |t|
      t.belongs_to :party, foreign_key: true
      t.references :guest, references: :users, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end

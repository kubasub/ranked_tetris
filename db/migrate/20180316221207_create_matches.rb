class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches, id: :uuid do |t|
      t.references :player_one, index: true, foreign_key: { to_table: :users }
      t.references :player_two, index: true, foreign_key: { to_table: :users }
      t.references :winner, index: true, foreign_key: { to_table: :users }
      t.boolean :player_one_won, null: false, default: true
      t.integer :player_one_elo_delta
      t.integer :player_two_elo_delta

      t.timestamps
    end
  end
end

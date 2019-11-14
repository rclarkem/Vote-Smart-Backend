class CreateTableVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :table_votes do |t|
      t.string :bill_id
      t.integer :for
      t.integer :against
    end
  end
end

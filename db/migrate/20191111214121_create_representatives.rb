class CreateRepresentatives < ActiveRecord::Migration[6.0]
  def change
    create_table :representatives do |t|
      t.string :proPublica_id
      t.string :short_title
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :ocd_id
      t.string :twitter_account
      t.timestamps
    end
  end
end

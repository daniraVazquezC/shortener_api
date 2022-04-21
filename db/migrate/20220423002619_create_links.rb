class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :short_link_code
      t.string :url
      t.integer :visitor_counter
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

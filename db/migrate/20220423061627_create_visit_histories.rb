class CreateVisitHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :visit_histories do |t|
      t.string :ip_address
      t.string :browser
      t.string :operating_system
      t.references :link, foreign_key: true
      t.timestamps
    end
  end
end

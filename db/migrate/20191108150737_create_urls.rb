class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :clicks

      t.index :short_url, unique: true
      t.index :long_url

      t.timestamps
    end
  end
end

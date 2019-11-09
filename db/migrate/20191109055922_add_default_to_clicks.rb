class AddDefaultToClicks < ActiveRecord::Migration[5.2]
  def change
    change_column :urls, :clicks, :integer, default: 0
  end
end

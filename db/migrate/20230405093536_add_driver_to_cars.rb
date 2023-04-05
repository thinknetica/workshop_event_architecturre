class AddDriverToCars < ActiveRecord::Migration[7.0]
  def change
    change_table :cars do |t|
      t.belongs_to :driver, type: :uuid, null: true, index: true, foreign_key: true
    end
  end
end

class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.belongs_to :driver, type: :uuid, null: true, foreign_key: true, index: true
      t.belongs_to :car,    type: :uuid, null: true, foreign_key: true, index: true
      t.belongs_to :user,   type: :uuid, null: true, foreign_key: true, index: true
      t.timestamps
    end
  end
end

class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :number
      t.string :level, null: false, default: 0
      t.string :state, null: false, default: 0
      t.timestamps
    end
  end
end

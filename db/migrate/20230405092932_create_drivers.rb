class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :name
      t.timestamps
    end
  end
end

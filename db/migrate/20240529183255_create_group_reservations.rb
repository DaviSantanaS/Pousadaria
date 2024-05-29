class CreateGroupReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :group_reservations do |t|
      t.string :name
      t.string :data_inicio
      t.string :data_fim

      t.timestamps
    end
  end
end

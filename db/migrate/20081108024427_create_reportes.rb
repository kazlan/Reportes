class CreateReportes < ActiveRecord::Migration
  def self.up
    create_table :reportes do |t|
      t.string :texto
      t.integer :tecnico_id
      t.string :tipo
      t.string :turno

      t.timestamps
    end
  end

  def self.down
    drop_table :reportes
  end
end

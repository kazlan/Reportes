class CreateTecnicos < ActiveRecord::Migration
  def self.up
    create_table :tecnicos do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :tecnicos
  end
end

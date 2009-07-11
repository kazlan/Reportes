class AddWarningToReportes < ActiveRecord::Migration
  def self.up
    add_column :reportes, :warning, :boolean
  end

  def self.down
    remove_column :reportes, :warning
  end
end

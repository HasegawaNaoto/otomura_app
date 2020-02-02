class AddColumnAreaToSerch < ActiveRecord::Migration[5.2]
  def change
      add_column :serches, :area, :string
  end
end

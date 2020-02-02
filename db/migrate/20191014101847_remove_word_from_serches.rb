class RemoveWordFromSerches < ActiveRecord::Migration[5.2]
  def change
    remove_column :serches, :word, :string
  end
end

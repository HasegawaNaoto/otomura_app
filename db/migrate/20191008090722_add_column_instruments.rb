class AddColumnInstruments < ActiveRecord::Migration[5.2]
  def change
    # add_column :instruments, :user_id, :integer
    add_column :instruments, :vocal, :boolean, default:false, null:false
    add_column :instruments, :guiter, :boolean, default:false, null:false
    add_column :instruments, :bass, :boolean, default:false, null:false
    add_column :instruments, :drum, :boolean, default:false, null:false
    add_column :instruments, :key, :boolean, default:false, null:false
    add_column :instruments, :dj, :boolean, default:false, null:false
    add_column :instruments, :sax, :boolean, default:false, null:false
    add_column :instruments, :violin, :boolean, default:false, null:false
    add_column :instruments, :other, :string,default:"", null:""
  end
end

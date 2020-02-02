class AddColumnSerches < ActiveRecord::Migration[5.2]
  def change
    add_column :serches, :gender, :string
    add_column :serches, :vocal, :boolean, default:false, null:false
    add_column :serches, :guiter, :boolean, default:false, null:false
    add_column :serches, :bass, :boolean, default:false, null:false
    add_column :serches, :drum, :boolean, default:false, null:false
    add_column :serches, :key, :boolean, default:false, null:false
    add_column :serches, :dj, :boolean, default:false, null:false
    add_column :serches, :sax, :boolean, default:false, null:false
    add_column :serches, :violin, :boolean, default:false, null:false
    add_column :serches, :other_instrument, :string,default:"", null:""
    add_column :serches, :emo, :boolean, default:false, null:false
    add_column :serches, :rock, :boolean, default:false, null:false
    add_column :serches, :punk, :boolean, default:false, null:false
    add_column :serches, :pop, :boolean, default:false, null:false
    add_column :serches, :ambient, :boolean, default:false, null:false
    add_column :serches, :alternative, :boolean, default:false, null:false
    add_column :serches, :classic, :boolean, default:false, null:false
    add_column :serches, :jazz, :boolean, default:false, null:false
    add_column :serches, :hard_rock, :boolean, default:false, null:false
    add_column :serches, :progressive, :boolean, default:false, null:false
    add_column :serches, :pop_punk, :boolean, default:false, null:false
    add_column :serches, :heavy_metal, :boolean, default:false, null:false
    add_column :serches, :metalcore, :boolean, default:false, null:false
    add_column :serches, :merocore, :boolean, default:false, null:false
    add_column :serches, :hiphop, :boolean, default:false, null:false
    add_column :serches, :instrument, :boolean, default:false, null:false
    add_column :serches, :western, :boolean, default:false, null:false
    add_column :serches, :japanese, :boolean, default:false, null:false
    add_column :serches, :acoustic, :boolean, default:false, null:false
    add_column :serches, :other_genre, :string, default:"", null:""
    add_column :serches, :word, :string, default:"", null:""
  end
end

class AddColumnGenres2 < ActiveRecord::Migration[5.2]
  def change
    # add_column :genres, :user_id, :integer
    add_column :genres, :rock, :boolean, default:false, null:false
    add_column :genres, :punk, :boolean, default:false, null:false
    add_column :genres, :pop, :boolean, default:false, null:false
    add_column :genres, :ambient, :boolean, default:false, null:false
    add_column :genres, :alternative, :boolean, default:false, null:false
    add_column :genres, :classic, :boolean, default:false, null:false
    add_column :genres, :jazz, :boolean, default:false, null:false
    add_column :genres, :hard_rock, :boolean, default:false, null:false
    add_column :genres, :progressive, :boolean, default:false, null:false
    add_column :genres, :pop_punk, :boolean, default:false, null:false
    add_column :genres, :heavy_metal, :boolean, default:false, null:false
    add_column :genres, :metalcore, :boolean, default:false, null:false
    add_column :genres, :merocore, :boolean, default:false, null:false
    add_column :genres, :hiphop, :boolean, default:false, null:false
    add_column :genres, :instrument, :boolean, default:false, null:false
    add_column :genres, :western, :boolean, default:false, null:false
    add_column :genres, :japanese, :boolean, default:false, null:false
    add_column :genres, :acoustic, :boolean, default:false, null:false
    add_column :genres, :other1, :string, default:"", null:""
    add_column :genres, :other2, :string, default:"", null:""
    add_column :genres, :other3, :string, default:"", null:""
    add_column :genres, :other4, :string, default:"", null:""
    add_column :genres, :other5, :string, default:"", null:""
  end
end

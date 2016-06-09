class AddMainPictureToSculptures < ActiveRecord::Migration
  def change
    add_column :sculptures, :main_picture, :string
  end
end

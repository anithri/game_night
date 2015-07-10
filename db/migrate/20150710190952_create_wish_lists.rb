class CreateWishLists < ActiveRecord::Migration
  def up
    Player.all.each do |p|
      p.create_wish_list(name: "#{p.name}'s Wish List")
      p.save
    end
  end
end

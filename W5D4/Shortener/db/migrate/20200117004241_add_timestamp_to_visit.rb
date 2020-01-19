class AddTimestampToVisit < ActiveRecord::Migration[5.2]
  def change
    add_timestamps(:visits, null:false)
  end
end

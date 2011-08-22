class Item < ActiveRecord::Base

  belongs_to :category
  
  def groups
    []
  end

end

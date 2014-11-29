class Menu < ActiveRecord::Base
		belongs_to :user

  def menu_br
    description.gsub(/\n/, '<br/>') 
  end
end

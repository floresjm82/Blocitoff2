class Item < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :name
  validates :name, length: {maximum: 100}


end

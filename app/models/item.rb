class Item < ActiveRecord::Base
  require 'action_view'
  include ActionView::Helpers::DateHelper

  belongs_to :user

  validates_presence_of :name
  validates :name, length: {maximum: 100}


end

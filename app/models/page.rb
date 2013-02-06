class Page < ActiveRecord::Base
  include PageRepository

  attr_accessible :body, :slug, :title
  validates :body, presence: true
end

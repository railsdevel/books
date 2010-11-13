class Book < ActiveRecord::Base
  belongs_to :list, :dependent => :destroy

  validates_presence_of :title, :author
end

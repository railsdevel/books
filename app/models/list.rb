class List < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_many :books

  accepts_nested_attributes_for :books, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  validates_presence_of :name
  validates_size_of :books, :minimum => 1
end

class List < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  has_many :books

  accepts_nested_attributes_for :books, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true

  validates_presence_of :name

  validate do |list|
    list.errors.add_to_base("A list cannot have zero books") if list.books.blank?
  end
end

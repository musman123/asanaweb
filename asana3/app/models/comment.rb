class Comment < ActiveRecord::Base
  belongs_to :task 
  has_one   :picture, as: :pictureable
  accepts_nested_attributes_for :picture ,reject_if: :all_blank , allow_destroy: true
end

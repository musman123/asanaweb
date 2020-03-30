class Task < ActiveRecord::Base
     has_and_belongs_to_many :projects
     belongs_to :user
     has_many :comments, dependent: :destroy
     accepts_nested_attributes_for :projects ,reject_if: :all_blank, allow_destroy: true
     accepts_nested_attributes_for :comments ,reject_if: :all_blank, allow_destroy: true
     has_one   :picture, as: :pictureable
     accepts_nested_attributes_for :picture ,reject_if: :all_blank , allow_destroy: true
     accepts_nested_attributes_for :user ,reject_if: :all_blank , allow_destroy: true 
end

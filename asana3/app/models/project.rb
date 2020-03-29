class Project < ActiveRecord::Base
    has_and_belongs_to_many :tasks
    has_one   :picture, as: :pictureable
    accepts_nested_attributes_for :picture ,reject_if: :all_blank , allow_destroy: true
end

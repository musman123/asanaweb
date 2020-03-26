class UsrProj < ActiveRecord::Base
    has_and_belongs_to_many :functions
end

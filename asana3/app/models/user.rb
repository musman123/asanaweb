class User < ActiveRecord::Base
    validates :name, presence: true 
    validates :email, presence: true,  uniqueness: true       
    has_many  :tasks
    has_one   :picture, as: :pictureable
    accepts_nested_attributes_for :picture 
    accepts_nested_attributes_for :tasks ,reject_if: :all_blank , allow_destroy: true
    attr_accessor :password, :password_conformation
end

class User < ActiveRecord::Base
    validates :name, presence: true 
    validates :email, presence: true,  uniqueness: true       
    has_many  :tasks, dependent: :destroy
    has_one   :picture, as: :pictureable
    accepts_nested_attributes_for :picture  
    attr_accessor :password, :password_conformation
end

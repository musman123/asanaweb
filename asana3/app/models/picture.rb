class Picture < ActiveRecord::Base
    belongs_to :pictureable, polymorphic: true
    has_attached_file :photo,
    styles: { medium: "10x10>", thumb: "10x10>" },
    default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end

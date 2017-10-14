class User < ApplicationRecord	
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
	validates :firstname, :lastname, :email, :password, presence: true
	validates :email, uniqueness: true
	validates :phone, uniqueness: true
	validates :gender, inclusion: %w(male female)
	validates :email, uniqueness: {case_sensitive: false}
	validates :password, length: { in: 6..20 }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end


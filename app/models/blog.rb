class Blog < ActiveRecord::Base
	belongs_to :user
	validates :apellation, presence:true, 
	           length: {minimum:4, maximum: 50}
    validates :caption, presence:true, 
               length: {minimum:10, maximum: 100}
	validates :specification, presence:true, 
	           length: {minimum:4, maximum: 50}
	validates :user_id, presence: true
end
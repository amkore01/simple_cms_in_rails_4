class Section < ActiveRecord::Base

	belongs_to :page
	has_many :section_edits
	#has_many :users, :through => :section_edits
	has_many :editors, :through => :section_edits, :class_name => "User"
	
	acts_as_list :scope=> :page
	
	after_save :touch_page
	
	CONTENT_TYPES = ["text","HTML"]
	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	validates_presence_of :content
	validates_inclusion_of :content_type, :in => ['text','HTML'], :message => "must be one of: #{CONTENT_TYPES.join(', ')}"	
	
	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("sections.position ASC") }
	scope :newest_first, lambda { order("sections.created_at DESC") }
	scope :search, lambda { |query|
		where(["name LIKE ?","%#{query}%"]) 
	}
	
	private
		def touch_page
			page.touch
		end
end

class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :title, :minimum => 5
  has_many :comments
  belongs_to :user
  has_many :categories

  has_attached_file :photo, :styles => { :thumb => "100x100#", :small  => "150x150>" },
		:url  => "/assets/posts/:id/:style/:basename.:extension",
                :path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension"
  validates_attachment_size :photo, :less_than => 10.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  acts_as_taggable

  accepts_nested_attributes_for :categories, :allow_destroy => :true  ,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  acts_as_state_machine :initial => :draft, :column => 'state'
  state :draft            
  state :published

  event :publish do 
    transitions :from => :draft, :to => :published 
  end

  event :suspend do 
    transitions :from => :published, :to => :draft 
  end

  named_scope :published_posts, {:conditions => ["state=?", "published"]}
  named_scope :draft_posts, {:conditions => ["state=?", "draft"]}
end

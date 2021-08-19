class Post < ApplicationRecord

  validates :title, length: { minimum: 10 }
  validates :content, length: { minimum: 10, maximum: 10000 }

  scope :free, -> { where(premium: false) }
  # Ex:- scope :active, -> {where(:active => true)}

  def to_s
    title
  end

end

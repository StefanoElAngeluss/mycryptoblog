class Post < ApplicationRecord

  validates :title, length: { minimum: 10 }
  validates :content, length: { minimum: 10, maximum: 10000 }

end

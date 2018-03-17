class Post < ApplicationRecord
     belongs_to :topic 
     belongs_to :user
     has_many :comments, dependent: :destroy
       default_scope { order('created_at DESC') }
#note: models can filter our database, we are going to filter our db by lenght and presence

   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   validates :topic, presence: true
   validates :user, presence: true

end

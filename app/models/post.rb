class Post < ApplicationRecord
     belongs_to :topic 
     has_many :comments, dependent: :destroy

#note: models can filter our database, we are going to filter our db by lenght and presence

   validates :title, length: { minimum: 5 }, presence: true
   validates :body, length: { minimum: 20 }, presence: true
   validates :topic, presence: true


end

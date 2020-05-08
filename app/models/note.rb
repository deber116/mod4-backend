class Note < ApplicationRecord
    belongs_to :user
    has_many :note_tags, dependent: :delete_all
    has_many :tags, through: :note_tags
end
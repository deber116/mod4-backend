class User < ApplicationRecord
    has_many :notes, dependent: :destroy
    validates :username, uniqueness: { case_sensitive: false }
end
  
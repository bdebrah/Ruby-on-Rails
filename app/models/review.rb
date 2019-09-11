class Review < ApplicationRecord
    belongs_to :item
    belongs_to :user
    validates  :content, presence: true
    validates  :user_id, presence: true,  uniqueness: { scope: :item_id }
    validates  :item_id, presence: true
end

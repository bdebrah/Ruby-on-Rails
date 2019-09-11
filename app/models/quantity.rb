class Quantity < ApplicationRecord
    belongs_to :item
    belongs_to :user
    validates  :quantity, presence: true,
            numericality: { 
                only_integer: true, 
                :greater_than_or_equal_to => 1,
                :less_than_or_equal_to => 10}
    validates  :user_id, presence: true,  uniqueness: { scope: :item_id }
    validates  :item_id, presence: true
end

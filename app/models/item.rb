class Item < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :ratings
    has_many :reviews
    has_many :quantities
    has_attached_file :picture, styles: { medium: "1000x1000>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
    def average(id)
        @ratings = Rating.where(item_id:id).pluck(:ratings)
        if @ratings.empty?
            "There is no rating for this item"
        else
            (@ratings.inject{ |sum, el| sum + el }.to_f / @ratings.size).round(2)
        end
    end
    # This defines the paypal url for a given product sale
    has_many :payment_notifications
end

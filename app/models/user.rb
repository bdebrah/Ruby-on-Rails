class User < ApplicationRecord
    has_many :ratings
    has_many :reviews
    has_many :quantities
    before_save  {email.downcase}
    validates    :username,  presence: true, length: {maximum:  50}
    VALIDE_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates    :email,  presence:   true,   length: {maximum:  150}, format:  {with:   VALIDE_EMAIL_REGEX},  uniqueness:  {case_sensitive:  false}
    has_secure_password
    validates    :password,  presence: true, length: {minimum:  8}
    has_and_belongs_to_many :items
    
    def paypal_url(return_url, cancel_return) 
        total = 0
        items.each do |item|
            quantity = Quantity.where(:item_id => item.id, :user_id => id).pluck(:quantity)[0]
            if quantity.nil?
                quantity=1
            end
            total += item.price * quantity
        end
    values = { 
    :business => 'your_sandbox_facilitato_email@example.com',
       :cmd => '_xclick',
    :upload => 1,
    :return => return_url,
    :rm => 2,
    # :notify_url => notify_url,
    :cancel_return => cancel_return
    }   
    values.merge!({ 
    "amount" => total,
    "item_name" => 'test',
    "item_number" => '1',
    "quantity" => '1'
    })
         # For test transactions use this URL
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    end
    
    has_many :payment_notifications
end
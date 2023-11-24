class User < ApplicationRecord

    enum role: { supplier: 0, customer: 1}   
    after_initialize :set_default_role, if: :new_record?
    has_many :products
   
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :name, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 } 

    private

    def set_default_role
        self.role ||= :customer
    end    
end
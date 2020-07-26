class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    #has_secure_password
    #before_action :require_admin
    def mood
        if nausea_rating > happiness_rating
            mood == sad
        else mood == happy
        end
    end

    def require_admin
    end

   
end

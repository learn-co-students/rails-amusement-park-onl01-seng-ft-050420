class User < ActiveRecord::Base
    # t.string "name" # t.string "password_digest" # t.integer "nausea" # t.integer "happiness" # t.integer "tickets" # t.integer "height"
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if !self.admin
            self.nausea < self.happiness ? "happy" : "sad"
        end
    end
    
end

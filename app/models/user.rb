class User < ApplicationRecord
    has_secure_password
    # validates :name, :password, :happiness, :nausea, :height, :tickets, presence: true
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        if self.happiness && self.nausea
            if self.happiness >= self.nausea
                "happy"
            else
                "sad"
            end
        else
            "content"
        end
    end

end

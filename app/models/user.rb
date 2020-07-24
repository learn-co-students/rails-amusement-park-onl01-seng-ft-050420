class User < ActiveRecord::Base
    has_secure_password
    # validates :name, presence: true 
    # validates :height, presence: true
    # validates :nausea, presence: true, :inclusion => {:in => [1,5]}
    # validates :happiness, presence: true, :inclusion => {:in => [1,5]}



    has_many :rides
    has_many :attractions, through: :rides 

    def mood 
        if admin != true 
            if happiness > nausea 
                'happy'
            else 
                'sad'
            end
        end
    end
end

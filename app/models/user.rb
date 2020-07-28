class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password
    #before_action :require_admin
   # def mood #mood is an instance method, use self in this case
       # if self.nausea > self.happiness
            #@mood = "sad"  
       #     return 'sad'  
       # else
            #@mood = "happy"
       #     return 'happy'
     #   end
    #end

    #if self.happiness > self.nausea
      #  return 'happy'
      #else
      #  return 'sad'
      #end
   # end
   def mood
    unless admin
        happiness > nausea ? 'happy' : 'sad'
    end
    end 

    
   
end

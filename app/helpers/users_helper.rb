module UsersHelper
    def admin_display(user)
       if user.admin
            tag.h1("ADMIN")
       end
    #    else
    #         content_tag(:p, "Hello, #{user.name}!")
    #         content_tag(:p, "Name: #{user.name}")
    #         content_tag(:p, "Mood: #{user.mood}")
    #         content_tag(:p, "Nausea: #{user.nausea}")
    #         content_tag(:p, "Happiness: #{user.happiness}")
    #         content_tag(:p, "Tickets: #{user.tickets}")
    #         content_tag(:p, "Height: #{user.height}")
    #    end
    end
end

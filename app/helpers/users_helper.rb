module UsersHelper
    def admin_display(user)
        if user.admin
            tag.h1("ADMIN")
        end
    end
end

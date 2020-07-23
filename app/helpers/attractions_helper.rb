module AttractionsHelper
    def admin_add_attraction(user)
        if user.admin
            link_to 'New Attraction', new_attraction_path
        end
    end

    def admin_show_attraction(attraction)
        if current_user.admin 
            link_to "Show #{attraction.name}", attraction_path(attraction)
        else
            link_to "Go on #{attraction.name}", attraction_path(attraction)
        end
    end

    def admin_edit_attraction(attraction)
        if current_user.admin
            link_to "Edit Attraction", edit_attraction_path(attraction)
        end
    end
end

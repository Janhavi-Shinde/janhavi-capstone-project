module GoalsHelper
    def spheres_helper
        current_user.spheres.all
    end
end

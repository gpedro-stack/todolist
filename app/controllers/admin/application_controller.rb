# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_user!
    before_action :restrict_access_to_admin_pages

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end



    # Resto do código...

    private

    def restrict_access_to_admin_pages
      redirect_to root_path unless current_user.email == "admin@gmail.com"
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end

module V1
  module CustomDevise
    class SessionsController < Devise::SessionsController
      prepend_before_filter :require_no_authentication, :only => [:create ]
      include Devise::Controllers::Helpers

      respond_to :json

      def create
        self.resource = warden.authenticate!(auth_options)
        sign_in(resource_name, resource)
      end

      def destroy
        sign_out(resource_name)
      end

    end
  end
end
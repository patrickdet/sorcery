module Sorcery
  module Controller
    module Submodules
      module AuthenticationToken
        def self.included(base)
          base.send(:include, InstanceMethods)
          Config.login_sources << :login_from_authentication_token
        end

        module InstanceMethods

          protected

          def login_from_authentication_token
            @current_user = (user_class.find_by_authentication_token(params[:auth_token]) if params[:auth_token] || false
            auto_login(@current_user) if @current_user
            @current_user
          end
        end
      end
    end
  end
end

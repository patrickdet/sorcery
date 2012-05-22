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
            user = params[:auth_token] && user_class.find_by_authentication_token(params[:auth_token])
            if user
              @current_user = user
            else
              @current_user = false
            end
          end
        end
      end
    end
  end
end

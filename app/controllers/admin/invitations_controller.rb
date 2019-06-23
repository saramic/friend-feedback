module Admin
  class InvitationsController < Admin::ApplicationController
    def scoped_resource
      super.where(user: current_user)
    end
  end
end

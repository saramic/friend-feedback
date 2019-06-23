module Admin
  class QuizzesController < Admin::ApplicationController
    def scoped_resource
      super.where(organiser: current_user)
    end
  end
end

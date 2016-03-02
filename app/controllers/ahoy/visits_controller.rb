module Ahoy
  class VisitsController < BaseController
    def create
      return render json: {visit_id: nil, visitor_id: nil} unless current_user.registered?

      ahoy.track_visit
      render json: {visit_id: ahoy.visit_id, visitor_id: ahoy.visitor_id}
    end
  end
end

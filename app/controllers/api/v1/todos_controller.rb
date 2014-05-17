class Api::V1::TodosController < InheritedResources::Base
  skip_before_filter :verify_authenticity_token
  respond_to :json

  private

  def permitted_params
    params.permit(todo: [:title, :is_completed])
  end
end

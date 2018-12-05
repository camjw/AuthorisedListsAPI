# frozen_string_literal: true

# responds to requests with jsons
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end

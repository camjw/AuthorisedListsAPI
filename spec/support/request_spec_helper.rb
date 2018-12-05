# frozen_string_literal: true

# Adds a nice JSON method for testing requests
module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end
end

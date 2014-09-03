module Phase2
  class ControllerBase
    attr_reader :req, :res

    # Setup the controller
    def initialize(req, res)
      @req = req
      @res = res
    end

    # Helper method to alias @already_built_response
    def already_built_response?
      @already_built_response == res
    end

    # Set the response status code and header
    def redirect_to(url)
      res.status = 302
      res["location"] = url
      if already_built_response?
        raise Exception
      else
        @already_built_response = res
      end
    end

    # Populate the response with content.
    # Set the response's content type to the given type.
    # Raise an error if the developer tries to double render.
    def render_content(content, type)
      res.content_type = type
      res.body = content
      if already_built_response?
        raise Exception
      else
        @already_built_response = res
      end
    end
  end
end


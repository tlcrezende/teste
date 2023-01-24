class ApiConstraints
    def initialize(options)
      @version = options[:version]
      @default = options[:default]
    end
  
    def matches?(req)
      # An error appears when the '&' operator is not present (validation required)
      @default || req.headers['Accept']&.include?("application/vnd.library.v#{@version}")
    end
end
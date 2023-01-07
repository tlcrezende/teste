class ApiConstraints
    def initialize(options)
      @version = options[:version]
      @default = options[:default]
    end
  
    def matches?(req)
      # Um erro aparece quando o operador '&' não está presente (validação obrigatória)
      @default || req.headers['Accept']&.include?("application/vnd.library.v#{@version}")
    end
end
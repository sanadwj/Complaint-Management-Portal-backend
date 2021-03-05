Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete, :options, :head],
             credentials: true
    end

  # allow do
  #   origins 'production url'
  #   resource '*', headers: :any, methods: [:get, :post, :patch, :put],
  #            credentials: true
  # end
end
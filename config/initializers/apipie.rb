Apipie.configure do |config|
  config.app_name                = "Vaadhyar"
  config.api_base_url            = "https://vaadhyar.herokuapp.com"
  config.doc_base_url            = "/apidoc"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.app_info                = <<-EOS
    ==== API LAYER
      API Documentation for Vaadhyar Application
  EOS
end

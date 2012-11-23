Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "222107374474034", "74cae46ebb891e882a8416e0485835fb", {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}, :scope => 'publish_stream,email'}
  #provider :developer unless Rails.env.production?
  provider :twitter, "lgIoqDNhvLTgzG38LYqw", "b01EoEfBRxO8MyCCeKJY74trUUuycYaVB3ApSmLPk"
  #provider :google, "137215199501.apps.googleusercontent.com", "glmiuQI06-0x7GF6n2NiH9bq", :client_options => {:ssl => {:ca_path => '/etc/ssl/certs'}}
end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '798c61cb43477588ef25', 'f4d2fcf131435c79f0a73468962ff3870a12bdac'
end
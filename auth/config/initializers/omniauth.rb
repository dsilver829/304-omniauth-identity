Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'N0Zut2yr9koNshhLHkPQ', 'zpFE8FrrWVt9c4NqtcjuPtX6NWlcf6PaKdSYdp3w'
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
  provider :identity, on_failed_registration: lambda { |env|
    IdentitiesController.action(:new).call(env)
  }
end

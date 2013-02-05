Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook,
  '203315456477331',
  '0e244b346d09ed649f264445cf834348'

end
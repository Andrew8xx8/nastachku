Configus.build Rails.env do
  env :production do
    mailer do
      default_host "nastachku.ru"
      default_from "noreply@nastachku.ru"
    end

    admin do
      email ""
      password ""
      first_name = "admin"
      last_name = "admin"
    end

    token do
      lifetime 1.hour
    end
    facebook do
      app_id ''
      app_secret ''
    end
  end

  env :development, parent: :production do
    admin do
      email "admin@np.kaize.ru"
      password "123456"
    end
    facebook do
      app_id '203315456477331'
      app_secret '0e244b346d09ed649f264445cf834348'
    end
  end

  env :test, parent: :production do

  end

  env :staging, parent: :production do
    admin do
      email "admin@np.kaize.ru"
      password "123456"
      first_name = "admin"
      last_name = "admin"
    end

    basic_auth do
      username 'admin'
      password '123654'
    end
    
    facebook do
      app_id '203315456477331'
      app_secret '0e244b346d09ed649f264445cf834348'
    end
  end
end
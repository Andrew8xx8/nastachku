# encoding: utf-8

Configus.build Rails.env do
  env :production do

    pagination do
      audits_per_page 20
    end

    schedule do
      first_day Time.utc(2013, 4, 12)
      second_day Time.utc(2013, 4, 13)
    end

    mailer do
      default_host "nastachku.ru"
      default_from "noreply@nastachku.ru"
    end

    admin do
      email "admin@np.kaize.ru"
      password "123456"
      first_name "Админ"
      last_name "Админов"
      city 'Москва'
    end

    token do
      lifetime 1.hour
    end

    facebook do
      app_id '223587801118877'
      app_secret 'd196986f373c3fe86f79d881e270ae97'
    end

    twitter do
       key 'xH0ui4CoEcH39X5ucFyk0w'
       secret 'qqJwi8Nc3NQMHcm6IEbi4dYA8Z6eKpv8uSqm9VpMCEA'
    end

  end

  env :development, parent: :production do
    admin do
      email "admin@np.kaize.ru"
      password "123456"
      first_name "Админ"
      last_name "Админов"
    end

    facebook do
      app_id '223587801118877'
      app_secret 'd196986f373c3fe86f79d881e270ae97'
    end

  end

  env :test, parent: :production do
  end

  env :staging, parent: :production do
    admin do
      email "admin@np.kaize.ru"
      password "123456"
      first_name "Админ"
      last_name "Админов"
    end

    basic_auth do
      username 'admin'
      password '123654'
    end

    facebook do
      app_id '223587801118877'
      app_secret 'd196986f373c3fe86f79d881e270ae97'
    end
    
  end

end

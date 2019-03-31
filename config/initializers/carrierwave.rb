CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'fog/aws',
    aws_access_key_id: 'AKIAUENSDK2S6WMX3OZ',
    aws_secret_access_key: 'Tj9BwvW/2mYnZOiLueFUMSxbQUcm+yMvHj4SYbMn',
    region: 'Asia Pacific (Tokyo)'
  }
  config.fog_directory  = 'rails-myportfolio'
  config.cache_storage = :fog
end



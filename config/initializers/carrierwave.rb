#Fog.credentials_path = Rails.root.join('config/s3.yml')
#s3_conf = YAML.load_file("#{Rails.root}/config/s3.yml")[Rails.env]
#Fog.credentials_path = YAML.load(File.read("#{Rails.root}/config/s3.yml"))[Rails.env]

#日本語ファイル
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
  # config_file = File.join(Rails.root, 'config', 's3.yml')
  # APP_CONFIG = YAML.load(File.open(config_file))[Rails.env]
  # access_key = APP_CONFIG[:aws_access_key_id]
  # secret_key = APP_CONFIG[:aws_secret_access_key]
  # region = APP_CONFIG[:region]

  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: ENV['AWS_REGION']
  }
  config.fog_public = false
  config.fog_authenticated_url_expiration = 60

  case Rails.env
    when 'production'
      config.fog_directory = "octfilestorage"

    when 'development'
      config.fog_directory = "dev.octfilestorage"

    when 'test'
      config.fog_directory = "test.octfilestorage"
  end
end

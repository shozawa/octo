#日本語ファイル
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|
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

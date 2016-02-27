CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAIXI2XT3XPRIQY3JQ',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }
  config.fog_public = false

  case Rails.env
    when 'production'
      config.fog_directory = 'octfilestorage'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/octfilestorage'

    when 'development'
      config.fog_directory = 'dev.octfilestorage'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.octfilestorage'

    when 'test'
      config.fog_directory = 'test.octfilestorage'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.octfilestorage'
  end
end

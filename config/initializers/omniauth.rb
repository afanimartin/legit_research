Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '316995614744-lv4hsaejbs52c04gc24feod9a4vimied.apps.googleusercontent.com', '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'
end

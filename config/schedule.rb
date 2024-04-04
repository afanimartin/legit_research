every 1.day, at: '12:00 am' do
  rake "subscriptions:archive_expired"
end

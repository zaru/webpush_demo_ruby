desc 'Generate VAPID keys'
task :generate_vapid do
  require 'webpush'
  vapid_key = Webpush.generate_key

  File.write('./vapid_keys/private_key', vapid_key.private_key)
  File.write('./vapid_keys/public_key', vapid_key.public_key)
end

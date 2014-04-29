S3DirectUpload.config do |c|
  #c.access_key_id = ENV["AWS_ACCESS_KEY_ID"],       # your access key id
  c.secret_access_key = ENV["AWS_SECRET_ACCESS_KEY"]   # your secret access key
  c.bucket = "adhesion-#{Rails.env}"              # your bucket name
  c.region = "us-west-2"             # region prefix of your bucket url. This is _required_ for the non-default AWS region, eg. "s3-eu-west-1"
  c.url = "https://#{c.bucket}.s3.amazonaws.com/"                # S3 API endpoint (optional), eg. 
end
# This gets set as an array if done in the above block... work around sets it to the right value
S3DirectUpload.config.access_key_id = ENV["AWS_ACCESS_KEY_ID"]
# puts "new value of config: #{S3DirectUpload.config.access_key_id}"

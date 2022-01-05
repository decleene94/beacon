if ENV["REDISCLOUD_URL"]
    $redis = Redis.new(:url => ENV["redis://default:CpEO9LeaeDTW98c6SO5pRMIU5ly3mTYK@redis-16630.c3.eu-west-1-1.ec2.cloud.redislabs.com:16630"])
end

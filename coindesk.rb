require "uri"
require "net/http"
require "json"


url = URI("https://api.coindesk.com/v1/bpi/historical/close.json")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
data_api = response.read_body

data = JSON.parse(data_api)

# puts data.class

data_hash = data["bpi"]

# puts data_hash

filtered_data = []
data_hash.each do | key, value |
    if value > 5000
        filtered_data.push( value )
    end

end

print filtered_data
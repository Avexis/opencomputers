local internet = require("internet")
local os = require("os")

function main() 
  while true do
    postData(transformData(getStats()))
    -- doActions(getActions())
    os.sleep(5)
  end

end

function postData(data)
  url = "https://avexis-opencomputers.firebaseio.com/stats.json"
  username = "sindre.boyum@gmail.com"
  password = "avexis"
  key = "vjeum9alawHPXq6UY5TPlfMEhAyuiFwygKi7LWbt"

  internet.request(url .. "?" .. key, data, {"Authorization", "Basic " .. username .. ":" .. password})
  responseCode, response, headers = internet.response()
  internet.close()
end

function getStats()
  power = checkPowerStats()
  resources = checkResourceStats()

  return power, resources
end

function checkPowerStats()
  producing = 100
  stored = 1000
  maxStorage = 10000
  
  return "{\"producing\": " .. producing ..", \"stored\": " .. stored .. ", \"maxStorage\": ".. maxStorage .."}"
end

function checkResourceStats()
  return ""
end

function transformData(power, resources)
  return "{\"power\":" .. power .. ", \"resources\": ".. resources .."}"
end
local internet = require("internet")
local os = require("os")

function main()
  fetchTimeoutInSeconds = 10
  -- while true do
    postData(transformJson(getStats()))
    -- doActions(getActions())
  --   os.sleep(fetchTimeout)
  -- end

end

function postData(data)
  url = "https://avexis-opencomputers.firebaseio.com/stats.json"
  username = "sindre.boyum@gmail.com"
  password = "avexis"
  key = "vjeum9alawHPXq6UY5TPlfMEhAyuiFwygKi7LWbt"

  responseCode, response, headers = internet
    .request(url .. "?" .. key, data, {"Authorization", "Basic " .. username .. ":" .. password})
    .response()

  print(responseCode)
  print(response)
  -- responseCode, response, headers = internet.response()
  -- internet.close()
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
  
  json = "{\"producing\": " .. producing ..", \"stored\": " .. stored .. ", \"maxStorage\": ".. maxStorage .."}"

  return json
end

function checkResourceStats()
  json = "\"\""
  return json
end

function transformJson(power, resources)
  json = "{\"power\":" .. power .. ", \"resources\": ".. resources .."}"
  print("Json: " .. json)
  return json
end

main()
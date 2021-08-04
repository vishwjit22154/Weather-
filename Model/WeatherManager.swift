import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/find?units=metric&appid=c1714d4b263f85ee3645687a7d63b351"
    
    func fetch(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
       
    }
    
    func performRequest(urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                if let safeData = data {
                    let goingToDecode = safeData
                   parseJSON(weatherData: safeData)
                    print(goingToDecode)
                }
            }
            task.resume()
        }
        
    }

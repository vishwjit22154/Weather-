import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let message: String
    let error: String
}

struct Main: Decodable {
    let temp: Double
}

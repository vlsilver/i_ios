//
//  WeatherManager.swift
//  Clima
//
//  Created by niBVL on 13/10/2021.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(error: Error)
    
}

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=a3882f54306a65915e1de811df0c9da3&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String)  {
        let urlString = weatherUrl + "&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fethWeather(latitude: Double, longitude:Double )  {
        let urlString = weatherUrl + "&lon=\(longitude)&lat=\(latitude)"
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString: String)  {
        //1. Create URL
        if let url = URL(string: urlString) {
            //2. Create a URLSession
            let session = URLSession(configuration: .default)
            //3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if let errorHandle = error {
                    self.delegate?.didFailWithError(error: errorHandle)
                    return
                }
                if let safeData = data {
                    if let weatherModel =  self.parseJson(safeData) {
                        self.delegate?.didUpdateWeather(weather: weatherModel)
                    }
                }
            }
            //4. Start task
            task.resume()
        }
    }
    
    func parseJson(_ weatherData: Data)  -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try  decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name =  decodedData.name
            let weatherModel =  WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weatherModel
        } catch  {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}


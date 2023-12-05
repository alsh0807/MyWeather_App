//
//  ContentView.swift
//  MyWeather
//
//  Created by dgsw8th16 on 12/4/23.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State var currentWeather: WeatherModel? = nil
    
    @ObservedObject var locationManager = LocationManager()
    
    let url = "https://api.openweathermap.org/data/2.5/weather"
    
    func weatherRequest() {
        
        
        
        DispatchQueue.global().async {
            
            AF.request("\(url)?lat=\(locationManager.latitude)&lon=\(locationManager.longitude)&appid=\(Bundle.main.appKey)",
                       method: .post)
            
            .responseDecodable(of: WeatherModel.self) { response in
                switch response.result {
                case .success(let data):
                    self.currentWeather = data
                case .failure(let error):
                    print("\(error)")
                }
            }
            
        }
    }
    
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            if let current = currentWeather {
                Text("")
                
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Text(String(format: "%.2f°C", toCelius(current.main.temp)))
                    .customAppleSDFont(30, weight: .bold)
                
                HStack {
                    Text("3 초전")
                    
                    Button {
                        weatherRequest()
                    } label: {
                        Image(systemName: "goforward")
                    }
                }
                
                
            }
            else {
                Text("불러오는 중...")
            }
            
            
        }
        .onAppear {
            weatherRequest()
        }
        
    }
}

func toCelius(_ calvin: CGFloat) -> CGFloat {
    return calvin - 273.15
}




#Preview {
    ContentView()
}

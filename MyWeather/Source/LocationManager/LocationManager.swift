//
//  LocationManager.swift
//  MyWeather
//
//  Created by dgsw8th16 on 12/4/23.
//

import Foundation
import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    @Published var authorisationStatus: CLAuthorizationStatus?
    
    var latitude: Double {
        locationManager.location?.coordinate.latitude ?? 35.663067537
    }
    
    var longitude: Double {
        locationManager.location?.coordinate.longitude ?? -128.41363277
    }
    
    var location: CLLocation {
        locationManager.location ?? CLLocation(latitude: 35.663067537, longitude: -128.41363277)
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingHeading()
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorisationStatus = locationManager.authorizationStatus
        
        switch authorisationStatus {
        case .authorizedWhenInUse:
            locationManager.requestLocation()
            break
        case .authorizedAlways:
            manager.requestLocation()
            break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }

}




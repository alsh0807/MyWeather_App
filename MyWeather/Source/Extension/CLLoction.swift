//
//  CLLoction.swift
//  MyWeather
//
//  Created by dgsw8th16 on 12/5/23.
//

import Foundation
import CoreLocation

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
           CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
       }
}

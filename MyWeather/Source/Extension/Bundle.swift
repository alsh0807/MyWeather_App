//
//  Bundle.swift
//  MyWeather
//
//  Created by dgsw8th16 on 12/4/23.
//

import SwiftUI

extension Bundle {
    var appKey: String {
        guard let path = self.url(forResource: "AppID", withExtension: "plist") else {
            return ""
        }
        guard let resource = NSDictionary(contentsOf: path) else {
            return " "
        }
        
        guard let key = resource["API_KEY"] as? String else {
            fatalError("value 가 할당되어 있지 않습니다.")
        }
        
        return key
        
    }
}

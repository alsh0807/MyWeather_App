//
//  Text.swift
//  MyWeather
//
//  Created by dgsw8th16 on 12/5/23.
//


import SwiftUI

extension Text {
    func customAppleSDFont(_ size: CGFloat, weight: Font.Weight = .medium) -> Text {
        return self.font(.custom("Apple SD Gothic Neo", size: size).weight(weight))
    }
}

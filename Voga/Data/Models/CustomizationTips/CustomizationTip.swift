//
//  CustomizationTip.swift
//  Voga
//
//  Created by Emilio Costa on 15/09/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct CustomizationTip: Hashable, Decodable, Identifiable {
    var id: UUID {
        UUID()
    }

    var customizationTipId: Int = 1
    var category: String = "camisas"
    var theme: String = "darkPink"
    var secondaryTheme: String = "lightPink"
    var card: Card = Card()
    var details: Details = Details()
}

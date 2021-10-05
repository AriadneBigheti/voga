//
//  Fabric.swift
//  Voga
//
//  Created by Emilio Costa on 05/10/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Fabric: Hashable, Decodable, Identifiable {
    
    var id: UUID {
        UUID()
    }

    var fabricId: Int = 1
    var title: String = "camisas"
    var subtitle: String = "lightPink"
    var description: String = "lightPink"
    var environmentalImpacts: EnvironmentalImpacts = EnvironmentalImpacts()
    var alternatives: [String] = [
        "Couro vegano",
        "Couro reciclado"
    ]
}

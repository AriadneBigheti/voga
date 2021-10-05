//
//  EnvironmentalImpacts.swift
//  Voga
//
//  Created by Emilio Costa on 05/10/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct EnvironmentalImpacts: Hashable, Decodable, Identifiable {
    var id: UUID {
        UUID()
    }

    private var severity: String = "sustainable"
    var severityType: SustainabilityType {
        SustainabilityType.getFromString(sustainability: severity)
    }
    
    var waterImpacts: InformationImpact = InformationImpact()
    var feedstockImpacts: InformationImpact = InformationImpact()
    var decompositionTime: InformationImpact = InformationImpact()
    var anotherImpacts: String = "Lorem ipsum dolor sit amet, consectetur adipis cing elit. Mauris cursus nunc non ligula fermentum viverra. Sed non dapibus mi, nec aliqu massa."
}

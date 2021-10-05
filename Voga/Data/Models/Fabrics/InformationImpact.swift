//
//  InformationImpact.swift
//  Voga
//
//  Created by Emilio Costa on 05/10/21.
//


import Foundation
import SwiftUI
import CoreLocation

struct InformationImpact: Hashable, Decodable, Identifiable {
    
    var id: UUID {
        UUID()
    }

    private var severity: String = "sustainable"
    var severityType: SustainabilityType {
        SustainabilityType.getFromString(sustainability: severity)
    }
    
    var description: String = "<50 anos>"
}

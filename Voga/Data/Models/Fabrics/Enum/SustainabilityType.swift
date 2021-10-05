//
//  SustainabilityType.swift
//  Voga
//
//  Created by Caio Roberto Aceti on 27/09/21.
//

enum SustainabilityType: String {
    case sustainable
    case fairlySustainable
    case unsustainable
    
    static func getFromString(sustainability: String) -> SustainabilityType {
        if let value = SustainabilityType(rawValue: sustainability) {
            return value
        }

        return .sustainable
    }
}

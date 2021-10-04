//
//  Card.swift
//  Voga
//
//  Created by Emilio Costa on 15/09/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Card: Hashable, Decodable, Identifiable {
    var id: UUID {
        UUID()
    }

    var title: String = "Ideias de como mudar sua camiseta."
    var image: String = "<link>"
}

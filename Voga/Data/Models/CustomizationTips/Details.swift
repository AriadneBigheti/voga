//
//  Details.swift
//  Voga
//
//  Created by Emilio Costa on 15/09/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Details: Hashable, Decodable, Identifiable {
    var id: UUID {
        UUID()
    }

    var title: String = "Ideias de como mudar sua camiseta."
    var titleImage: String = "<link>"
    var subtitle: String = "<h>Uma tesoura</h> pode mudar tudo."
    var description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean vulputate, arcu quis accumsan faucibus, orci quam rhoncus orci, a feugiat odio nibh fermentum tellus. Nulla tristique fringilla ipsum."
    var descriptionImage: String = "<link>"
    var tips: [Tip] = [Tip()]
}

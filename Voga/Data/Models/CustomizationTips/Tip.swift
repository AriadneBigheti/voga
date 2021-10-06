//
//  Tip.swift
//  Voga
//
//  Created by Emilio Costa on 15/09/21.
//

import Foundation

struct Tip: Hashable, Decodable, Identifiable {
    var id: UUID {
        UUID()
    }
    
    var theme: String = "lightPink"
    var title: String = "Como fazer um cropped da sua camiseta."
    var description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Siga os seguintes passos:"
    var steps: [String] = [
        "Vista a camiseta e marque com a ajuda de um giz a altura que você quer que ela fique.",
        "Tire a camiseta do seu corpo e usando uma régua, trace uma reta na altura que tinha marcado.",
        "Agora pegue uma boa tesoura e corte a camiseta na reta que você traçou."
    ]
    var cloujure: String = "E seu novo cropped está pronto, é só vestir e sair usando!"
    var image: String = "<link>"
}

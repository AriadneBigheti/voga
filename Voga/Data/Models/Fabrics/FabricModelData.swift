//
//  ModelData.swift
//  Voga
//
//  Created by Emilio Costa on 05/10/21.
//

import Foundation

var fabrics: [Fabric] = loadFabrics()

func loadFabrics<Fabric: Decodable>() -> Fabric {
    let data: Data

    guard let file = Bundle.main.url(forResource: "fabricsJSON", withExtension: ".json")
    else {
        fatalError("Couldn't find \("fabricsJSON") in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \("fabricsJSON") from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(Fabric.self, from: data)
    } catch {
        fatalError("Couldn't parse \("fabricsJSON") as \(Fabric.self):\n\(error)")
    }
}

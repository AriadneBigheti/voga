//
//  ModelData.swift
//  Voga
//
//  Created by Emilio Costa on 15/09/21.
//

import Foundation

var customizationTips: [CustomizationTip] = loadCustomizationTips()

func loadCustomizationTips<CustomizationTip: Decodable>() -> CustomizationTip {
    let data: Data

    guard let file = Bundle.main.url(forResource: "customizationTipsJSON", withExtension: ".json")
    else {
        fatalError("Couldn't find \("customizationTipsJSON") in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \("customizationTipsJSON") from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(CustomizationTip.self, from: data)
    } catch {
        fatalError("Couldn't parse \("customizationTipsJSON") as \(CustomizationTip.self):\n\(error)")
    }
}

//
//  PredatorController.swift
//  JP Apex Predators SwiftUI
//
//  Created by Italo Stuardo on 22/11/23.
//

import Foundation

class PredatorController {
    private var apexPredators: [ApexPredator] = []
    var filteredPredators: [ApexPredator] = []
    let typeFilters = ["All", "Land", "Air", "Sea"]
    
    init() {
        decodePredatorData()
    }
    
    func decodePredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
                filteredPredators = apexPredators
            } catch {
                print("Error decoding JSON data: \(error)")
            }
        }
    }
    
    func sortByAlphabetical() {
        apexPredators.sort(by: { $0.name < $1.name})
    }
    
    func sortByMovieAppearance() {
        apexPredators.sort(by: {$0.id < $1.id})
    }
    
    func typeIcon(for type: String) -> String {
        switch type {
        case "All":
            return "square.stack.3d.up.fill"
        case "Land":
            return "leaf.fill"
        case "Air":
            return "wind"
        case "Sea":
            return "drop.fill"
        default:
            return "questionmark"
        }
    }
    
    func filterByType(_ type: String) {
        switch type {
        case "Land", "Air", "Sea":
            filteredPredators = apexPredators.filter {
                $0.type == type.lowercased()
            }
        default:
            filteredPredators = apexPredators
        }
    }
}

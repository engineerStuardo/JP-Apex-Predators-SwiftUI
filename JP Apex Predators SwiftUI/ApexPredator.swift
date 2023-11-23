//
//  ApexPredator.swift
//  JP Apex Predators SwiftUI
//
//  Created by Italo Stuardo on 22/11/23.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    var typeOverlay: Color {
        switch type {
        case "land":
            return .brown
        case "air":
            return .teal
        case "sea":
            return .blue
        default:
            return .brown
        }
    }
    var image: String {
        name.lowercased().filter { $0 != " "}
    }
}

struct MovieScene: Codable, Identifiable {
    let id: Int
    let movie: String
    let sceneDescription: String
}

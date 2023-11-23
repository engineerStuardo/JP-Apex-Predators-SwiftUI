//
//  PredatorImage.swift
//  JP Apex Predators SwiftUI
//
//  Created by Italo Stuardo on 23/11/23.
//

import SwiftUI

struct PredatorImage: View {
    var predatorImage: String
    
    var body: some View {
        Image(predatorImage)
            .resizable()
            .scaledToFit()
            .padding()
    }
}

#Preview {
    let movieScene = MovieScene(id: 3, movie: "Jurassic Park III", sceneDescription: "A young adult Tyrannosaurus appears in Jurassic Park 3. According to the official size charts, it is 37 feet long and 14.5 feet tall. When Alan Grant and the other survivors escape the Spinosaurus, they encounter the creature who is just feeding on another dinosaur. The group runs back towards the Spinosaurus and a huge battle occurs between the Tyrannosaurus and the Spinosaurus. The Spinosaurus kills the T-Rex by snapping its neck in its powerful jaws.")
    let predator = ApexPredator(id: 3, name: "Tyrannosaurus Rex", type: "land", movies: [
        "Jurassic Park",
        "The Lost World: Jurassic Park",
        "Jurassic Park III",
        "Jurassic World",
        "Jurassic World: Fallen Kingdom"
    ], movieScenes: [movieScene], link: "https://jurassicpark.fandom.com/wiki/Tyrannosaurus_rex")
    return PredatorImage(predatorImage: predator.image)
        .preferredColorScheme(.dark)
}

//
//  PredatorDetail.swift
//  JP Apex Predators SwiftUI
//
//  Created by Italo Stuardo on 22/11/23.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    @State var showPredator = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing) {
                Image(predator.type)
                    .resizable()
                    .scaledToFit()
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/4)
                    .shadow(color: .black, radius: 6, x: 0, y: 0)
                    .offset(y: -210)
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                    .onTapGesture {
                        showPredator.toggle()
                    }
                    .sheet(isPresented: $showPredator, content: {
                        PredatorImage(predatorImage: predator.image)
                    })
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                        .padding(.bottom, 8)
                    Text("Appears In:")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding([.top, .bottom], 1)
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    Text("Read More:")
                        .font(.caption)
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                }
                .padding(.top, -230)
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    let movieScene = MovieScene(id: 3, movie: "Jurassic Park III", sceneDescription: "A young adult Tyrannosaurus appears in Jurassic Park 3. According to the official size charts, it is 37 feet long and 14.5 feet tall. When Alan Grant and the other survivors escape the Spinosaurus, they encounter the creature who is just feeding on another dinosaur. The group runs back towards the Spinosaurus and a huge battle occurs between the Tyrannosaurus and the Spinosaurus. The Spinosaurus kills the T-Rex by snapping its neck in its powerful jaws.")
    let movieScene2 = MovieScene(id: 2, movie: "Jurassic Park II", sceneDescription: "A young adult Tyrannosaurus appears in Jurassic Park 3. According to the official size charts, it is 37 feet long and 14.5 feet tall. When Alan Grant and the other survivors escape the Spinosaurus, they encounter the creature who is just feeding on another dinosaur. The group runs back towards the Spinosaurus and a huge battle occurs between the Tyrannosaurus and the Spinosaurus. The Spinosaurus kills the T-Rex by snapping its neck in its powerful jaws.")
    let predator = ApexPredator(id: 3, name: "Tyrannosaurus Rex", type: "land", movies: [
        "Jurassic Park",
        "The Lost World: Jurassic Park",
        "Jurassic Park III",
        "Jurassic World",
        "Jurassic World: Fallen Kingdom"
    ], movieScenes: [movieScene, movieScene2], link: "https://jurassicpark.fandom.com/wiki/Tyrannosaurus_rex")
    return PredatorDetail(predator: predator)
        .preferredColorScheme(.dark)
}

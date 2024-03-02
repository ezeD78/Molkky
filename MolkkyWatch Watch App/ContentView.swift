//
//  ContentView.swift
//  MolkkyWatch Watch App
//
//  Created by Ezequiel Gomes on 18/02/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var  iPhoneConnexion = WatchToIos()
    @State var scoreenCours = 0
    
    var body: some View {
        if iPhoneConnexion.gameBrain != nil {
            VStack {
                Image(systemName: "iphone.badge.play").imageScale(.large)
                Text("Merci de paramétrer le jeu sur l'iPhone")
              
               
            }
        }
        else{
            VStack {
               // Text("Tour n° \( iPhoneConnexion.gameBrain!.nbtour+1)")
                Text("Tour n° 1 : Franck")
             
                Picker(selection: $scoreenCours, label: Text("Score:")) {
//                    Text("1").tag(1)
//                    Text("2").tag(2)
//                    Text("3").tag(3)
//                    Text("4").tag(4)
                    ForEach( 0 ..< 13)  { i in
                        Text("\(i)").tag(i)
                    }
                    
                    
                }
                Button("valider") {
                    print("toto")
                }
            }
            
        }
        
    }
}
#Preview {
    ContentView()
}

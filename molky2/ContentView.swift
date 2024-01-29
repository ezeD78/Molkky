//
//  ContentView.swift
//  molky2
//
//  Created by Ezequiel Gomes on 09/01/2024.
//

import SwiftUI

struct ContentView: View {
  
    @State var nbJoueur = 2
    var body: some View {
        NavigationView {
            VStack {
        
                Text("combien de personnes vont jouer ?  ")
                Stepper("\(nbJoueur)", value: $nbJoueur, in: 2 ... 9 ).padding()
                NavigationLink(destination: {
                    InscriptionDesParticipant(nbjoueur: nbJoueur)
                }, label: {
                    Text("Suivant")
                })
                    .navigationTitle("Molky")
                    
    }
            
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}

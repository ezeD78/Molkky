//
//  inscriptionDesParticipant.swift
//  molky2
//
//  Created by Ezequiel Gomes on 09/01/2024.
//

import SwiftUI

struct InscriptionDesParticipant: View {
    var nbjoueur : Int 
    @State  var nom : [String]
    @State var enable = false
    
        init(nbjoueur : Int) {
            self.nbjoueur = nbjoueur
            self.nom = Array(repeating: "", count: nbjoueur)

        
    }
    var body: some View {
      ScrollView {
          ForEach (0..<nbjoueur, id: \.self){ i in
              TextField(" prénom joueur n°\(i+1) ", text: $nom[i]).padding()
            }
              Spacer()
            .navigationTitle("Nom des joueurs")
            
      }
        NavigationLink {
            EcranDejeux(gameBrain: GameBrain(nomJoueurs: nom))
        } label: {
            Text("Suivant")
        }.disabled(enable)

        
        
       
        
              }
    }


#Preview {
    InscriptionDesParticipant(nbjoueur: 5)
}

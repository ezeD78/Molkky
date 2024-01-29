//
//  inscriptionDesParticipant.swift
//  molky2
//
//  Created by Ezequiel Gomes on 09/01/2024.
//

import SwiftUI

struct InscriptionDesParticipant: View {
    var nbjoueur : Int 
    @State  var nom  = ""
    
    var body: some View {
      ScrollView {
            ForEach (0..<nbjoueur){ i in
                TextField(" prénom joueur n°\(i+1) ", text: $nom).padding()
            }
              Spacer()
            .navigationTitle("Nom des joueurs")
      }
           
        }
    }


#Preview {
    InscriptionDesParticipant(nbjoueur: 2)
}

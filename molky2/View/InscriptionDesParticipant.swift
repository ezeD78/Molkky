//
//  inscriptionDesParticipant.swift
//  molky2
//
//  Created by Ezequiel Gomes on 09/01/2024.
//

import SwiftUI

struct InscriptionDesParticipant: View {
    var nbjoueur : Int 
    var isOn : Bool
    @State  var noms : [String]
    @State var disabled = true
    @FocusState private var focusedField: String?
    
    init(nbjoueur : Int, isOn : Bool) {
            self.nbjoueur = nbjoueur
            self.noms = Array(repeating: "", count: nbjoueur)
            self.isOn = isOn

        
    }
    var body: some View {
        VStack {
            ScrollView {
                ForEach (0..<nbjoueur, id: \.self){ i in
                    TextField(" prénom joueur n°\(i+1) ", text: $noms[i]).padding().id("TextField\(i)")
                        .focused($focusedField, equals: "TextField\(i)")
                    
                }.onSubmit {
                    checkChamps()
                    
                }
                Spacer()
                    .navigationTitle("Nom des joueurs")
                
            }
            
            NavigationLink(value: GameBrain(nomJoueurs: noms, isOne: isOn)) {
                Text("Suivant")
            }.disabled(disabled)
                .navigationDestination(for: GameBrain.self) { game in
                    EcranDejeux(gameBrain: game)
                }
        }
        
       
        
              }
    
    func checkChamps()  {
        for i in 0 ... noms.count-1 {
         
            if noms[i] == ""{
                disabled = true
                focusedField = "TextField\(i)"
                return
            }
            
               disabled = false
            
        }
    }
    }


#Preview {
    InscriptionDesParticipant(nbjoueur: 5, isOn: [true, true])
}

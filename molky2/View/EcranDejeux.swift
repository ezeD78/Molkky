//
//  EcranDejeux.swift
//  molky2
//
//  Created by Ezequiel Gomes on 01/02/2024.
//

import SwiftUI

struct EcranDejeux: View {
    @StateObject var gameBrain : GameBrain
    @State var scoreEnCoursValidation = 0
    @State var showEcranClassementFin = false
    @State var showEcranClassementEnCours = false
     var connectionWatch  = WatchConnector()
    var molkyGridControler = MolkyGridController()
    
   
    
    var body: some View {
        
        
       
            
        ZStack {
            Color(red: gameBrain.joueurs[gameBrain.numeroJoueurEnCours].couleur[0], green: gameBrain.joueurs[gameBrain.numeroJoueurEnCours].couleur[1], blue: gameBrain.joueurs[gameBrain.numeroJoueurEnCours].couleur[2]).ignoresSafeArea()
            VStack {
                Text("Tour n°\(gameBrain.nbtour+1)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.semibold)
                
                HStack {
                    Text("Joueur :").font(.system(size: 18))
                    Text("\(gameBrain.joueurs[gameBrain.numeroJoueurEnCours].nom),").font(.system(size: 22)).bold()
                    Text("Score actuel :").font(.system(size: 18))
                    Text("\(gameBrain.joueurs[gameBrain.numeroJoueurEnCours].score)").font(.system(size: 22)).bold()
                }.padding()
                Spacer()
                MolkyGrid(molkyGridControler: molkyGridControler, ScoreEnCours: $scoreEnCoursValidation).frame(width: 350, height: 250).padding()
                
                HStack {
                    Text("Score en cours de validation :")
                    Text("\(scoreEnCoursValidation)")
                }
                
                Button("valider") {
                    gameBrain.valideTourJoueur(scoreJoueur: scoreEnCoursValidation)
                    molkyGridControler.reset()
                    scoreEnCoursValidation = 0
                    connectionWatch.sendtoWatch(gameBrain: gameBrain)
                    
                }.buttonStyle(.bordered).font(.system(size: 25)).padding()
                Spacer()
                
                
                
                
                
            }.navigationDestination(isPresented: $showEcranClassementFin, destination: {
                EcranClassementFin(findujeux: gameBrain.message.arretJeux, joueurs: gameBrain.exportJoueur())
            }).navigationBarBackButtonHidden(true)
                .alert(gameBrain.message.message, isPresented: $gameBrain.alert) {
                    Button("OK") {
                        if gameBrain.message.arretJeux{
                            showEcranClassementFin.toggle()
                        }
                        
                    }
            }
            
                .sheet(isPresented: $showEcranClassementEnCours, content: {
                    EcranClassementFin(findujeux: gameBrain.message.arretJeux, joueurs: gameBrain.exportJoueur())
                }).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            
                .toolbar(content: {
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showEcranClassementEnCours.toggle()
                        } label: {
                            Label("Voir le classement", systemImage: "list.star")
                                
                        }
                    }
                  
                    
                })
        }
    

//            .alert(isPresented: $gameBrain.alert, content: {
//                Alert(title: Text(gameBrain.message), primaryButton: .default(Text("voir le classement"), action: {
//                    showEcranClassementFin.toggle() // si ça ne s'affiche plus revenir à l'ancienne version
//                }), secondaryButton: .cancel())
//               
//        })
          
        
        
    }
}

#Preview {
    NavigationStack {
        EcranDejeux(gameBrain: GameBrain(nomJoueurs: ["Jakie","David"], isOne: [true, true]))
    }
}


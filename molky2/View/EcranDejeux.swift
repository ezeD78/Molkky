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
    @State var reset = false
    var vueGrid : molkyGrid
    
    
    var body: some View {
        VStack {
            Text("Tour n°\(gameBrain.nbtour+1)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.semibold).padding()
            
            HStack {
                Text("Joueur :").font(.system(size: 18))
                Text("\(gameBrain.joueurs[gameBrain.numeroJoueurEnCours].nom),").font(.system(size: 22)).bold()
                Text("Score actuel :").font(.system(size: 18))
                Text("\(gameBrain.joueurs[gameBrain.numeroJoueurEnCours].score)").font(.system(size: 22)).bold()
            }.padding()
            Spacer()
            molkyGrid(ScoreEnCours: $scoreEnCoursValidation).frame(width: 350, height: 250).padding()
            
            HStack {
                Text("Score en cours de validation :")
                Text("\(scoreEnCoursValidation)")
            }
            
            Button("valider") {
                gameBrain.valideTourJoueur(scoreJoueur: scoreEnCoursValidation)
                
            }.buttonStyle(.bordered).font(.system(size: 25)).padding()
            Spacer()
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EcranDejeux(gameBrain: GameBrain(nomJoueurs: ["Jakie","David"]))
}


//MARK : molkyGrid

struct molkyGrid: View {
    @StateObject var molkyGridControler = MolkyGridController()
    @Binding var ScoreEnCours : Int
   
   
    
    @State var scoreEncoursTempo = 0
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 6)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    
                    Image(systemName:  molkyGridControler.nomImage[6]).resizable().scaledToFit()
                })
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 8)
                    ScoreEnCours = molkyGridControler.scoreEncours
                    
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[8]).resizable().scaledToFit()
                })
                
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 7)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[7]).resizable().scaledToFit()
                })
                
                
            }
            HStack {
                
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 4)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[4]).resizable().scaledToFit()
                })
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 10)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[10]).resizable().scaledToFit()
                })
                
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 11)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[11]).resizable().scaledToFit()
                })
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 5)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[5]).resizable().scaledToFit()
                })
                
            }
            HStack {
                
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 2)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[2]).resizable().scaledToFit()
                })
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 9)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[9]).resizable().scaledToFit()
                })
                
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 3)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[3]).resizable().scaledToFit()
                })
                
            }
            HStack {
                
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 0)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[0]).resizable().scaledToFit()
                })
                Button(action: {
                    molkyGridControler.updateImage(numeroImage: 1)
                    ScoreEnCours = molkyGridControler.scoreEncours
                }, label: {
                    Image(systemName: molkyGridControler.nomImage[1]).resizable().scaledToFit()
                })
                
                
            }
        }
        
    }
    
    
    
}


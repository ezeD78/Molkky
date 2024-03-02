//
//  MolkyGrid.swift
//  molky2
//
//  Created by Ezequiel Gomes on 08/02/2024.
//

import SwiftUI


struct MolkyGrid: View {
    @StateObject var molkyGridControler : MolkyGridController
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



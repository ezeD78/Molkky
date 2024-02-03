//
//  GameBrain.swift
//  molky2
//
//  Created by Ezequiel Gomes on 29/01/2024.
//

import Foundation

class GameBrain : ObservableObject {
    @Published var joueurs : [Joueur] = []
    @Published var nbtour = 0
    @Published var numeroJoueurEnCours = 0

    
    init(nomJoueurs : [String]) {
        for nomjoueur in nomJoueurs {
            self.joueurs.append(Joueur(nom: nomjoueur))
        }
    }
    
    
    func valideTourJoueur(scoreJoueur : Int) {
        if scoreJoueur == 0 {
            joueurs[numeroJoueurEnCours].nbZeroconssecutif += 1
            
        }
        else {
            joueurs[numeroJoueurEnCours].score += scoreJoueur
        }
        
        
        if numeroJoueurEnCours < joueurs.count-1 {
            numeroJoueurEnCours += 1
            print("jhdjkh")
        }
        else {
            numeroJoueurEnCours = 0
            nbtour += 1
        }
        
           
    }
}

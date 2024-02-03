//
//  Joueur.swift
//  molky2
//
//  Created by Ezequiel Gomes on 29/01/2024.
//

import Foundation


class Joueur {
    var id : String
    var nom : String
    var score = 0
    var nbZeroconssecutif = 0
    
    init(nom: String) {
        self.nom = nom
        self.id = UUID().uuidString
    
    }
}

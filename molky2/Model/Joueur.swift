//
//  Joueur.swift
//  molky2
//
//  Created by Ezequiel Gomes on 29/01/2024.
//

import Foundation



class Joueur: NSObject, NSCoding {
    
    var nom : String
    var score = 0
    var nbZeroconssecutif = 0
    var eliminate = false
    var winner = false 
    var couleur = [ Double.random(in: 0 ... 1 ), Double.random(in: 0 ... 1 ), Double.random(in: 0 ... 1 )]
   // var couleur = CGColor(srgbRed: CGFloat.random(in: 0 ... 1 ), green: CGFloat.random(in: 0 ... 0.8 ), blue: CGFloat.random(in: 0 ... 0.4 ), alpha: 0.4)
    init(nom: String) {
        self.nom = nom
    }
    
    static func == (lhs: Joueur, rhs: Joueur) -> Bool {
        return lhs.nom == rhs.nom
    }
    
    required init?(coder: NSCoder) {
        guard let nom = coder.decodeObject(forKey: "nom") as? String else {
            return nil
        }

        self.nom = nom
        // Pour les types Int, utilisez decodeObject et convertissez ensuite en Int
        if let score = coder.decodeObject(forKey: "score") as? Int {
            self.score = score
        }

        if let nbZeroconssecutif = coder.decodeObject(forKey: "nbZeroconssecutif") as? Int {
            self.nbZeroconssecutif = nbZeroconssecutif
        }

        if let eliminate = coder.decodeObject(forKey: "eliminate") as? Bool {
            self.eliminate = eliminate
        }

        if let winner = coder.decodeObject(forKey: "winner") as? Bool {
            self.winner = winner
        }
        if let couleurData = coder.decodeObject(forKey: "couleur") as? Data,
                 let couleur = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSArray.self, from: couleurData) as? [Double] {
                  self.couleur = couleur
              }
        super.init()
    }

    func encode(with coder: NSCoder) {
        coder.encode(nom, forKey: "nom")
        // Pour les types Int, encodez-les en tant qu'objets
        coder.encode(NSNumber(value: score), forKey: "score")
        coder.encode(NSNumber(value: nbZeroconssecutif), forKey: "nbZeroconssecutif")
        coder.encode(NSNumber(value: eliminate), forKey: "eliminate")
        coder.encode(NSNumber(value: winner), forKey: "winner")
        let couleurData = try? NSKeyedArchiver.archivedData(withRootObject: couleur, requiringSecureCoding: false)
        coder.encode(couleurData, forKey: "couleur")
    }

    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(nom)
//    }
    
    
    func reset ()  {
        score = 0
        nbZeroconssecutif = 0
        eliminate = false
         winner = false
        
        
    }
    
    

    
}

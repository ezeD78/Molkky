//
//  GameBrain.swift
//  molky2
//
//  Created by Ezequiel Gomes on 29/01/2024.
//

import Foundation

class GameBrain : ObservableObject {
    
        
    static func == (lhs: GameBrain, rhs: GameBrain) -> Bool {
        return lhs.nbtour ==  rhs.nbtour
    }
    var isOn : Bool
    var joueurs : [Joueur] = []
    private var listeJoueurElimine : [Joueur] = []
    @Published var nbtour = 0
    @Published var numeroJoueurEnCours = 0
    @Published var alert = false
    var message = Message(message: "")
    
    
    required init?(coder: NSCoder) {
        guard let isOn = coder.decodeObject(forKey: "isOn") as? [Bool],
              let joueurs = coder.decodeObject(forKey: "joueurs") as? [Joueur],
              let listeJoueurElimine = coder.decodeObject(forKey: "listeJoueurElimine") as? [Joueur],
              let nbtour = coder.decodeObject(forKey: "nbtour") as? Int,
              let numeroJoueurEnCours = coder.decodeObject(forKey: "numeroJoueurEnCours") as? Int,
              let alert = coder.decodeObject(forKey: "alert") as? Bool,
              let message = coder.decodeObject(forKey: "message") as? Message 
        else {
            return nil }
        
        self.isOn = isOn
        self.joueurs = joueurs
        self.listeJoueurElimine = listeJoueurElimine
        self.nbtour = nbtour
        self.numeroJoueurEnCours = numeroJoueurEnCours
        self.alert = alert
        self.message = message

        //super.init()
    }
    
    func encode(with coder: NSCoder) {
            coder.encode(isOn, forKey: "isOn")
            coder.encode(joueurs, forKey: "joueurs")
            coder.encode(listeJoueurElimine, forKey: "listeJoueurElimine")
            coder.encode(nbtour, forKey: "nbtour")
            coder.encode(numeroJoueurEnCours, forKey: "numeroJoueurEnCours")
            coder.encode(alert, forKey: "alert")
            coder.encode(message, forKey: "message")
        }

       

    
    init(nomJoueurs : [String], isOne : Bool) {
        for nomjoueur in nomJoueurs {
            self.joueurs.append(Joueur(nom: nomjoueur))
        }
        self.isOn = isOne
    }
    
    
    init(joueurs : [Joueur]) {
        for joueur in joueurs {
            joueur.reset()
        }
        self.joueurs = joueurs
        self.isOn = true
    }
    
    
    func valideTourJoueur(scoreJoueur : Int) {
        
        
        if scoreJoueur == 0 {
            if isOn {
                joueurs[numeroJoueurEnCours].nbZeroconssecutif += 1
                if joueurs[numeroJoueurEnCours].nbZeroconssecutif == 3 {
                    
                    joueurs[numeroJoueurEnCours].eliminate = true
                    listeJoueurElimine.append(joueurs[numeroJoueurEnCours])
                    message.message = "\(joueurs[numeroJoueurEnCours].nom) est éliminé 💔"
                    joueurs.remove(at: numeroJoueurEnCours)
                    
                    if joueurs.count == 1 {
                        print("passage \(numeroJoueurEnCours + 1 )")
                        message.arretJeux.toggle()
                    }
                    alert = true
                    numeroJoueurEnCours -= 1
                    
                }
            }
            
        }
        
        else {
            joueurs[numeroJoueurEnCours].nbZeroconssecutif = 0
            joueurs[numeroJoueurEnCours].score += scoreJoueur
            
            if  joueurs[numeroJoueurEnCours].score > 50 {
               // if isOn[1] {
                    joueurs[numeroJoueurEnCours].score = 25
                    message.message = "\(joueurs[numeroJoueurEnCours].nom), score de 50 dépassé retour à 25 😢"
                    alert = true
                //}
            }
           
            else if joueurs[numeroJoueurEnCours].score == 50 {
                alert = true
                message.message = "Bravo \(joueurs[numeroJoueurEnCours].nom), c'est gagné 🥳"
                message.arretJeux.toggle()
                joueurs[numeroJoueurEnCours].winner = true
            }
        }
        
        if numeroJoueurEnCours + 1 == joueurs.count {
           
            numeroJoueurEnCours = 0
            nbtour += 1
        }
        else {
            numeroJoueurEnCours += 1
        }
        
    }
    
    
    func exportJoueur() -> [Joueur] {
        
       
            var joueurExport = joueurs
            for joueur in listeJoueurElimine {
                joueurExport.append(joueur)
            }
        
         
            return joueurExport.sorted { joueur1, joueur2 in
                 joueur1.score > joueur2.score
            }
        
    
        
        
    }
    
    func test () -> [Joueur] {
        
        joueurs[0].score = 8
        joueurs[1].score = 45
        joueurs[1].eliminate = true
        joueurs[2].score = 50
        joueurs[2].winner = true
        return exportJoueur()
    }
//    func hash(into hasher: inout Hasher) {
//        hasher = Hasher()
//    }
}

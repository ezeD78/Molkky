//
//  Message.swift
//  molky2
//
//  Created by Ezequiel Gomes on 11/02/2024.
//

import Foundation

class Message : NSObject, NSCoding {
    var message : String
    var arretJeux = false
    init(message: String) {
           self.message = message
          
       }
    
    
    func encode(with coder: NSCoder) {
        coder.encode(message, forKey: "message")
        coder.encode(arretJeux, forKey: "arretJeux")
    }
    
    required init?(coder: NSCoder) {
        guard let message = coder.decodeObject(forKey: "message") as? String,
              let arretJeux = coder.decodeObject(forKey: "arretJeux") as? Bool else {
            return nil
        }
        
        self.message = message
        self.arretJeux = arretJeux
    }
}


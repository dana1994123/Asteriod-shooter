//
//  Score.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-30.
//

import Foundation
import FirebaseFirestoreSwift

struct Score : Hashable , Codable{
    @DocumentID  var id : String? = UUID().uuidString
    var name : String = ""
    var score : Int = 0
    
    init(){
        
    }
    init(name : String , score : Int){
        self.name = name
        self.score = score
    }
    //parse json to swift obj
    init?(dictionary : [String: Any]){
        guard let name = dictionary["name"] as? String else{
            return nil
        }
        guard let score = dictionary["score"] as? Int else{
            return nil
        }
        
        self.init(name: name, score: score)
    }
    

}

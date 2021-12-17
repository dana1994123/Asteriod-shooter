//
//  Score.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-30.
//

import Foundation
import FirebaseFirestoreSwift

struct Score : Hashable , Codable{
    //obj to save in the firestore as a dictionary
    @DocumentID  var id : String? = UUID().uuidString
    var userName : String = ""
    var password : String  = ""
    var confirmPassword: String = ""
    var score : Int = 0
    var email: String = ""
    
    
    init(){
        
    }
    init(userName : String , score : Int, password : String, confirmPassword: String , email : String ){
        //inilize the object data 
        self.userName = userName
        self.score = score
        self.password = password
        self.confirmPassword = confirmPassword
        self.email = email
    }
    //parse json to swift obj
    init?(dictionary : [String: Any]){
        guard let userName = dictionary["userName"] as? String else{
            return nil
        }
        guard let password = dictionary["password"] as? String else{
            return nil
        }
        guard let score = dictionary["score"] as? Int else{
            return nil
        }
        guard let confirmPassword = dictionary["confirmPassword"] as? String else{
            return nil
        }
        guard let email = dictionary["email"] as? String else{
            return nil
        }
        
        self.init(userName: userName, score: score, password : password , confirmPassword: confirmPassword , email: email)
    }
    

}

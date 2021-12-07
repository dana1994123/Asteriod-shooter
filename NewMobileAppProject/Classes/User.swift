//
//  User.swift
//  NewMobileAppProject
//
//  Created by Ryan Haire on 2021-12-06.
//

import Foundation
import FirebaseFirestoreSwift

struct User : Hashable , Codable {
    @DocumentID  var id : String? = UUID().uuidString
    var email: String?
    var name: String?
    var password: String?
    var confirmPassword: String?
    
}

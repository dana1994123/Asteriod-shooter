//
//  UserViewModel.swift
//  NewMobileAppProject
//
//  Created by Roop Malhans on 2021-12-14.
//

import Foundation
import FirebaseFirestore

class userViewModel: ObservableObject{
    @Published var scores = [User]()
    private var db = Firestore.firestore()
    
    /* fetch the scores from the "Scores" collection from firebase  and display*/
    func fetchData(){
        db.collection("Scores").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                //error message
                print("No Data")
                return
            }
            
            self.scores = documents.map{(queryDocumentSnapshot ) -> User in
                
                let data = queryDocumentSnapshot.data()
                let name = data["userName"] as? String ?? ""
                let score = data["score"] as? Int ?? 100
                // instance of User class with name and score parameters
                return User (name: name, score: score)
            }
        }
    }
}

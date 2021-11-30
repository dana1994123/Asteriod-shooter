//
//  ScoreDBHelper.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-30.
//

import Foundation
import FirebaseFirestore

class FireDBHelper: ObservableObject{
    @Published var scoreLit = [Score]()
    private let store : Firestore
    private let COLLLECTION_NAME : String = "Scores"
    private static var shared : FireDBHelper?
    static func getInstance() -> FireDBHelper{
        if shared == nil{
            shared = FireDBHelper(database: Firestore.firestore())
        }
        return shared!
    }
    
    //one time
    init(database : Firestore){
        self.store = database
        
    }
    func insertScore(newScore : Score){
        do{
            try self.store.collection(COLLLECTION_NAME).addDocument(from:newScore)
        }
        catch let error as NSError{
            print(#function , "Error while inserting on firestore" , error)
        }
        
        
        
    }
    func getAllScore(){
        self.store.collection(COLLLECTION_NAME).addSnapshotListener({(querySnapshot , error) in
            guard let snapshot = querySnapshot else{
                print(#function , "error getting from listener")
                return
            }
            snapshot.documentChanges.forEach{(doChange) in
                var score = Score()
                do{
                    score = try doChange.document.data(as: Score.self)!
                    
                    if doChange.type == .added{
                        self.scoreLit.append(score)
                        print("new document is added")
                    }
                    if doChange.type == .modified{
                        
                    }
                    if doChange.type == .removed{
                        
                    }
                }
                catch let error as NSError{
                    print(#function , "Error while inserting on firestore" , error)
                }
            }
            
        })
        
    }
    func updateScore(){
        
    }
    func deleteScore(){
        
    }
}


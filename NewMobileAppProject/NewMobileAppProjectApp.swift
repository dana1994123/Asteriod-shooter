//
//  NewMobileAppProjectApp.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-11.
//

import SwiftUI
import Firebase
import FirebaseFirestore

@main
struct NewMobileAppProjectApp: App {
    let colors = Colors()
    let fireDBHelper : FireDBHelper
    
    init(){
        FirebaseApp.configure()
        fireDBHelper = FireDBHelper(database: Firestore.firestore())
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(colors).environmentObject(fireDBHelper)
        }
    }
}

//
//  NewMobileAppProjectApp.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-11.
//

import SwiftUI

@main
struct NewMobileAppProjectApp: App {
    let colors = Colors()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(colors)
        }
    }
}

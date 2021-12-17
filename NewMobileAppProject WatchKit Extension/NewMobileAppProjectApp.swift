//
//  NewMobileAppProjectApp.swift
//  NewMobileAppProject WatchKit Extension
//
//  Created by dana on 2021-11-11.
//

import SwiftUI

@main
struct NewMobileAppProjectApp: App {
    var images = ImagesInstruction()
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().environmentObject(images)
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

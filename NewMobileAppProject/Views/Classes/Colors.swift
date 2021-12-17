//
//  Colors.swift
//  NewMobileAppProject
//
//  Created by dana on 2021-11-16.
//

import Foundation
import SwiftUI

class Colors: ObservableObject {
    //a class that have a custom color resources 
    @Published var yellowCus = Color("yellowCus")
    @Published var redCus = Color("red")
    @Published var DarkBlueCus = Color("DarkBlueCus")
    @Published var LightBlueCus = Color("LightBlueCus")
    @Published var LightGreyCus = Color("LightGreyCus")
//    @Published var GreyCus = Color("GreyCus")
}

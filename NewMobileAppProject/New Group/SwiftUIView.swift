//
//  ComponentModifier.swift
//  NewMobileAppProject
//
//  Created by Roop Malhans on 2021-11-26.
//

import SwiftUI

struct Header1: ViewModifier {
    let colors = Colors()
    func body(content : Content) ->some View{
        return content
            .foregroundColor(self.colors.DarkBlueCus)
            .font(.system(size: 70))
            .padding(10)
    }
}

struct Header2: ViewModifier {
    let colors = Colors()
    func body(content : Content) ->some View{
        return content
            .foregroundColor(self.colors.DarkBlueCus)
            .font(.title)
            .frame(width: 130, height: 30,alignment: .center)
            .padding(10)
    }
}
struct Header3: ViewModifier {
    let colors = Colors()
    func body(content : Content) ->some View{
        return content
            .foregroundColor(self.colors.DarkBlueCus)
            .font(.system(size: 20))
            .frame(width: 130, height: 30,alignment: .center)
            .padding(10)
    }
}
struct Error: ViewModifier {
    let colors = Colors()
    func body(content : Content) ->some View{
        return content
            .foregroundColor(Color.red)
            .font(.system(size: 20))
            .frame(width: 130, height: 30,alignment: .center)
            .padding(10)
    }
}
struct TextFieldModifier: ViewModifier {
    let colors = Colors()
    func body(content : Content) ->some View{
        return content
            .foregroundColor(colors.LightBlueCus)
            .frame(width: 300, height: 30)
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(colors.yellowCus, lineWidth: 2))

    }
}
struct AppButtonModifier: ViewModifier {
    let colors = Colors()
    func body(content : Content) ->some View{
        return content
            .frame(width: 120, height: 50)
            .background(colors.redCus)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.trailing,50)
    }
}
struct MainAppButtonModifier: ViewModifier {
    func body(content : Content) ->some View{
        return content
            .frame(width: 300, height: 50,alignment: .center)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.bottom,20)
            .padding(.horizontal, 10)
    }
}

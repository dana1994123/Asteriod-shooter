//
//  AboutView.swift
//  NewMobileAppProject
//
//  Created by Roop Malhans on 2021-12-14.
//

import SwiftUI

struct AboutView: View {
    var person : People
    var body: some View {
            HStack {
                VStack{
                    Text("Name: \(person.Name)")
                        .font(.headline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(width: 300, height: 30, alignment: .leading)
                    Text("Bio: \(person.Bio)")
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                     .frame(width: 400, height: 30, alignment: .leading)
                    
                }
               
            }.frame(width: 30, height: 60, alignment: .trailing)//hstack
    }
}

struct ListView: View {
    @ObservedObject var fetch = GetData()
    var body: some View {
        ZStack{
            Image("bg2").resizable().frame(width: 1000, height: 1000, alignment: .center).opacity(0.8)
            VStack{
                Text("About Us").font(.title).modifier(Header1())
                ForEach(fetch.people, id: \.self){ p in
                    AboutView(person: p)
                }
            }
        }
    }
}

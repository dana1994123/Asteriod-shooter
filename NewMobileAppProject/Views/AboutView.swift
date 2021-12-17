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
                    /* displays the info of the user after fetching from the table*/
                   
                    Text("Name: \(person.Name)")
                        .font(.headline)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.leading)
                        .frame(width: 300, height: 25, alignment: .center)
                    Text("Bio: \(person.Bio)")
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                     .frame(width: 300, height: 25, alignment: .center)
                    }
                    
                }.frame(width: 300, height: 50, alignment: .center)//hstack
    }
}

struct ListView: View {
    //call the GetData Swift Class
    @ObservedObject var fetch = GetData()
    var body: some View {
        ZStack{
            Image("bg2").resizable().frame(width: 1000, height: 1000, alignment: .center).opacity(0.8)
            VStack{
                Image("aboutus")
//iterate over all the people 
                ForEach(fetch.people, id: \.self){ p in
                    AboutView(person: p)
                }
            }
        }
    }
}

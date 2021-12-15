//
//  ScoreUIView.swift
//  NewMobileAppProject
//
//  Created by Roop on 2021-12-14.
//

import SwiftUI

struct ScoreUIView: View {
    
    @ObservedObject private var viewModel = userViewModel()
    
    
    var body: some View {
        
        Text("Scores").font(.title)

            List(viewModel.scores){ user in
                HStack{
                    VStack(){
                    Text(user.name).font(.title)
                    Text(user.score).font(.subheadline)
                    }

                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .listStyle(SidebarListStyle())
                .onAppear(){
                    self.viewModel.fetchData()
                }
            
    }
}

struct ScoreUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreUIView()
    }
}

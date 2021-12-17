//
//  ScoreUIView.swift
//  NewMobileAppProject
//
//  Created by Roop on 2021-12-14.
//

import SwiftUI

struct ScoreUIView: View {
    
    //instantiate the userViewModel
    
    @ObservedObject private var viewModel = userViewModel()
    
    
    var body: some View {
        
        /* Searchs in the "Scores" collection on cloud firestore and fetches the scores of the users who
         have an account*/
        
        Text("Scores").font(.title)

        /* Fetched info will be displayed in a list format */
            List(viewModel.scores){ user in
                
                    VStack(){
                        HStack{
                    Text(user.name).font(.title)
                    Text(String(user.score)).font(.subheadline)
                    }

                }
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .listStyle(SidebarListStyle())
                .onAppear(){
                    // call the fetchData method of the USerViewModel
                    self.viewModel.fetchData()
                }
            
    }
}

struct ScoreUIView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreUIView()
    }
}

//  GetData.swift
//  NewMobileAppProject
//
//  Created by Roop Malhans on 2021-12-14.
//

import Foundation
public struct People: Codable, Hashable{
    
    public var ID: String
    public var Name: String
    public var Bio: String
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(Name)
    }
}


public class GetData: ObservableObject {
  
    // get the info from the table People
  @Published var people = [People]()
    
    init() {
          // php URL to connect to the server add fetch the info
        let url = URL(string: "https://malhanro.dev.fast.sheridanc.on.ca/project/sqlToJson.php")!
      //This method will run the task asynchronously
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let peopleData = data {
             // decode JSON data from the People table
                    let decodedData = try JSONDecoder().decode([People].self, from: peopleData)
                    DispatchQueue.main.async {
                        print(decodedData)
                        self.people = decodedData
                        
                    }
                } else {
                    print("No data")
                }
            } catch {
            
                print("Error: \(error)")
            }
        }.resume()
 
    }
      
}

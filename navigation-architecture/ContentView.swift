//
//  ContentView.swift
//  navigation-architecture
//
//  Created by İsmail Ertuğlu on 30.11.2022.
//

import SwiftUI
//Models
struct Company: Identifiable, Hashable {
    var id : UUID = UUID()
    let name: String
}

struct Stock: Identifiable, Hashable {
    var id : UUID = UUID()
    let ticker: String
}

//View


struct ContentView: View {
   
    let companies:[Company] = [
        .init(name: "Apple"),
        .init(name: "Facebook"),
        .init(name: "Google"),
        .init(name: "Microsoft"),
        .init(name: "Dell")
    ]
    let stocks:[Stock] = [
        .init(ticker: "APP"),
        .init(ticker: "Fbasdasd"),
        .init(ticker: "Goog"),
        .init(ticker: "MSCASD")
    ]
    @State var path : [Company] = []
    var body: some View {
        NavigationStack(path:$path){
            VStack{
                List(companies){ company in
                    NavigationLink(company.name,value: company)
                    
                }.navigationDestination(for:Company.self){ company in
                    VStack{
                        Text(company.name)
                        
                    }
                }
                Button("Go back"){
                    // popToRootViewController
                    /* path = [
                            companies[1],
                            companies[0],
                            companies[2]
                    ]*/
                    // path.append(companies[companies.count - 1])
                }
            }
            
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  TabbarNavigationArchitecture.swift
//  navigation-architecture
//
//  Created by İsmail Ertuğlu on 30.11.2022.
//

import SwiftUI

// MARK: Enum Case for Navigation Stack Items
enum NavigationType: String, Hashable {
    case dm = "DM VIEW"
    case camera = "CAMERA VIEW"
    case home  = "HOME"
}

struct TabbarNavigationArchitecture: View {
    //MARK: Creating a Navigation Stack
    // Where you can Push And Pop Views
    @State var mainStack : [NavigationType] = []
    var body: some View {
        NavigationStack(path: $mainStack){
            
            //MARK: Complex Structure with Tabview
            TabView{
                Text("Home").tabItem{
                    Image(systemName:"house.fill")
                }
                Text("Search").tabItem{
                    Image(systemName:"magnifyingglass")
                }
                Text("Liked").tabItem{
                    Image(systemName:"suit.heart.fill")
                }
                Text("Profile").tabItem{
                    Image(systemName:"person.circle.fill")
                }
            }.navigationTitle("Instagram")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            mainStack.append(.dm)
                        }
                        label:{
                            Image(systemName:"paperplane").font(.callout)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        Button{
                            mainStack.append(.camera)
                        }
                        label:{
                            Image(systemName:"camera").font(.callout)
                        }
                    }
                }
            //MARK: New API That Can Push New Base on DataType
                .navigationDestination(for: NavigationType.self){value in
                    switch value{
                    case .camera: VStack{
                        Text("CAmera view")
                        Button("Pop"){
                            // Just REmove Last Or Which View you need to remove from stacak
                            mainStack.removeLast()
                        }
                        Button("Go to camera DM View"){
                            mainStack.append(.dm)
                        }
                    }
                    case .home: Text("Home View")
                    case .dm: VStack {
                        Text("Dm View")
                        Button("Pop to Root View"){
                            mainStack.removeAll()
                        }
                    }
                }
                }
        }
        
    }
}

struct TabbarNavigationArchitecture_Previews: PreviewProvider {
    static var previews: some View {
        TabbarNavigationArchitecture()
    }
}

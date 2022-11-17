// Created by Prof. H in 2022
// Part of the RepoBrowser project
// Using Swift 5.0
// Qapla'

import SwiftUI

struct AppView: View {
  var body: some View {
    
    TabView {

      RepoListView(language: "swift")
      .tabItem {
          Image("swift_icon")
          Text("Swift")
      }

      RepoListView(language: "ruby")
      .tabItem {
          Image("ruby_icon")
          Text("Ruby")
      }
      
      RepoListView(language: "kotlin")
      .tabItem {
          Image("android-3-16")
          Text("Kotlin")
      }
      
      MoreListView()
        .tabItem {
          Image(systemName: "ellipsis").padding(.top, 100)
          Text("More")
        }
      
    }
    .environment(\.colorScheme, .light)
  }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}


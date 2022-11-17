// Created by Prof. H in 2022
// Part of the RepoBrowser project
// Using Swift 5.0
// Qapla'

import Foundation

class RepoViewModel: ObservableObject {

  // MARK: - Fields

  @Published var searchText: String = ""
  @Published var repos: [Repository] = []
  @Published var filteredRepos: [Repository] = []

  
  // MARK: - Methods
  
  func search(searchText: String) {
    filteredRepos = repos.filter { repo in
      return repo.name.lowercased().contains(searchText.lowercased())
    }
  }
  
}

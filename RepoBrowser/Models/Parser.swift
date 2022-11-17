// Created by Prof. H in 2022
// Part of the RepoBrowser project
// Using Swift 5.0
// Qapla'

import Foundation
import Alamofire

class Parser {

  var language: String
  var urlString: String
  
  init(language: String) {
    self.language = language
    self.urlString = "https://api.github.com/search/repositories?q=language:\(self.language.lowercased())&sort=stars&order=desc"
  }
  
// Old way of doing it with completion handlers...
//  func fetchRepositories(completionHandler: @escaping ([Repository]) -> Void) {
//    AF.request(self.urlString).responseDecodable(of: Repositories.self) { (response) in
//      guard let repositories: Repositories = response.value else { return }
//      completionHandler(repositories.items)
//    }
//  }

  func fetchRepositories() async -> [Repository] {
    let response = AF.request(self.urlString)
    let repositories = try? await response.serializingDecodable(Repositories.self).value
    return repositories?.items ?? []

  }
  
}

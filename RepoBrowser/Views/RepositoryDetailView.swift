// Created by Prof. H in 2022
// Part of the RepoBrowser project
// Using Swift 5.0
// Qapla'

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

  let request: URLRequest

  func makeUIView(context: Context) -> WKWebView  {
    return WKWebView()
  }

  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.load(request)
  }

}

//struct WebView_Previews: PreviewProvider {
//  static var previews: some View {
//    WebView(request: URLRequest(url: URL(string: "https://www.github.com")!))
//  }
//}

//
//  WebView.swift
//  H4XOR
//
//  Created by niBVL on 17/10/2021.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url:String?
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = url {
            if let safeURL =  URL(string: safeString) {
                let urlRequest = URLRequest(url: safeURL)
                uiView.load(urlRequest)
            }
        }
    }
}

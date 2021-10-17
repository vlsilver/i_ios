//
//  DetailView.swift
//  H4XOR
//
//  Created by niBVL on 17/10/2021.
//

import SwiftUI
import WebKit

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(url: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "")
    }
}



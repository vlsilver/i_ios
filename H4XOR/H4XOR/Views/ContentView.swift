//
//  ContentView.swift
//  H4XOR
//
//  Created by niBVL on 17/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataManager = DataManager()
    
    var body: some View {
        NavigationView {
            List(dataManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            }
            .navigationBarTitle("H4XOR NEWS")
        }.onAppear {
            self.dataManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



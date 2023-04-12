//
//  HomeView.swift
//  DemoEl
//
//  Created by Olof Thorén on 2023-04-12.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Home")
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
		HomeView()
    }
}

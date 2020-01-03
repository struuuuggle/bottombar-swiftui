//
//  ContentView.swift
//  Demo
//
//  Created by Mikiya Abe on 2019/12/28.
//  Copyright © 2019 Mikiya Abe. All rights reserved.
//

import SwiftUI
import BottomBar_SwiftUI

let items: [BottomBarItem] = [
    BottomBarItem(icon: "house.fill", title: "Home", color: .purple),
    BottomBarItem(icon: "heart", title: "Likes", color: .pink),
    BottomBarItem(icon: "magnifyingglass", title: "Search", color: .orange),
    BottomBarItem(icon: "person.fill", title: "Profile", color: .blue)
]

struct BasicView: View {
    let item: BottomBarItem
    
    var detailText: String {
        "\(item.title) Detail"
    }
    
    var followButton: some View {
        Button(action: openTwitter) {
            VStack {
                Text("Developed by Bezhan Odinaev")
                    .font(.headline)
                    .foregroundColor(item.color)
                
                Text("@smartvipere75")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
    
    var destination: some View {
        Text(detailText)
            .navigationBarTitle(Text(detailText))
    }
    
    var navigateButton: some View {
        NavigationLink(destination: destination) {
            ZStack {
                Rectangle()
                    .fill(item.color)
                    .cornerRadius(8)
                    .frame(height: 52)
                    .padding(.horizontal)
                
                Text("Navigate")
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
    }
    
    func openTwitter() {
        guard let url = URL(string: "https://twitter.com/smartvipere75") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            followButton
            
            Spacer()
            
            navigateButton
        }
    }
}

struct ContentView : View {
    @State private var selectedIndex: Int = 0
    
    var selectedItem: BottomBarItem {
        items[selectedIndex]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                BasicView(item: selectedItem)
                    .navigationBarTitle(Text(selectedItem.title))
                    .layoutPriority(1)
                BottomBar(selectedIndex: $selectedIndex, items: items)
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {    
    static var previews: some View {
        ContentView()
    }
}

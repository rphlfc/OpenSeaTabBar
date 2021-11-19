//
//  TabItem.swift
//  OpenSeaTabBar
//
//  Created by Raphael Cerqueira on 17/11/21.
//

import Foundation

struct TabItem: Identifiable {
    let id = UUID().uuidString
    let image: String
    let title: String
}

let tabItems = [
    TabItem(image: "house.fill", title: "Home"),
    TabItem(image: "chart.bar.fill", title: "Stats"),
    TabItem(image: "magnifyingglass", title: "Search"),
    TabItem(image: "person.circle", title: "Profile"),
    TabItem(image: "line.3.horizontal", title: "More")
]

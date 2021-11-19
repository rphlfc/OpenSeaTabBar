//
//  ContentView.swift
//  OpenSeaTabBar
//
//  Created by Raphael Cerqueira on 16/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTabIndex: Int = 0
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            HomeView()
                .tag(0)
            
            Text("Stats")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("AccentColor"))
                .tag(1)
            
            Text("Search")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("AccentColor"))
                .tag(2)
            
            Text("Profile")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("AccentColor"))
                .tag(3)
            
            Text("More")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("AccentColor"))
                .tag(4)
        }
        .overlay(
            VStack(spacing: 0) {
                Divider()
                
                HStack(alignment: .bottom) {
                    ForEach(0 ..< tabItems.count) { i in
                        VStack(spacing: 0) {
                            if selectedTabIndex == i {
                                Capsule()
                                    .fill(Color("PrimaryColor"))
                                    .frame(width: 30, height: 10)
                                    .mask(Rectangle().padding(.top, 3))
                                    .offset(y: -3)
                                    .matchedGeometryEffect(id: "tab", in: animation)
                            } else {
                                Capsule()
                                    .fill(Color.clear)
                                    .frame(width: 30, height: 10)
                            }
                            
                            Spacer()
                                
                            Image(systemName: tabItems[i].image)
                                .font(.title2.bold())
                            
                            Text(tabItems[i].title)
                                .font(.headline)
                                .fontWeight(.medium)
                                .padding(.top, 8)
                        }
                        .foregroundColor(selectedTabIndex == i ? Color("PrimaryColor") : Color.gray)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            withAnimation {
                                selectedTabIndex = i
                            }
                        }
                        .frame(height: 70)
                    }
                }
            }
                .background(Color("TabBarBackgroundColor").ignoresSafeArea())
            
            , alignment: .bottom
        )
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            VStack {
                HStack(spacing: 8) {
                    Circle()
                        .fill(Color("PrimaryColor"))
                        .frame(width: 50, height: 50)
                        .overlay(
                            Image("boat")
                                .foregroundColor(.white)
                        )
                    
                    Text("OpenSea")
                        .font(.title2)
                        .fontWeight(.heavy)
                }
                .foregroundColor(Color("AccentColor"))
                
                Divider()
            }
            .background(Color("TabBarBackgroundColor").ignoresSafeArea())
            
            Spacer()
            
            Text("Home")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("AccentColor"))
                .tag(1)
            
            Spacer()
        }
        .background(Color("BackgroundColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

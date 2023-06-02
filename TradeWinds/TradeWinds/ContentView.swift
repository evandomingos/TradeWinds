//
//  ContentView.swift
//  TradeWinds
//
//  Created by Evan Domingos on 5/29/23.
//

import SwiftUI

//import
struct ToolbarIcon: View {
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: 20))
            .foregroundColor(.white)
            .frame(width: 40, height: 40)
    }
}


struct ContentView: View {
    @State private var isExpanded = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Set black background
            
            VStack {
                Spacer()
                
                Text("TradeWinds")
                    .foregroundColor(.white) // Set white text color
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    if isExpanded {
                        ExpandedToolbarView(isExpanded: $isExpanded)
                            .transition(.move(edge: .leading))
                    }
                    
                    Spacer() // Add a spacer to push the circle to the right
                    
                    Circle()
                        .frame(width: 50, height: 50) // Set circle size
                        .foregroundColor(.blue) // Set blue circle color
                        .overlay(
                            Image(systemName: isExpanded ? "arrow.right" : "arrow.left")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .onTapGesture {
                                    withAnimation {
                                        isExpanded.toggle()
                                    }
                                }
                        )
                }
                .padding(.trailing, 20) // Adjust the value based on your needs
            }
        }
    }
}

struct ExpandedToolbarView: View {
    @Binding var isExpanded: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.blue)
                .frame(height: 50)
                .padding(.trailing, 50) // Adjust the value based on your needs
            
            HStack(spacing: 10) {
                ToolbarIcon(systemName: "cloud.sun")
                ToolbarIcon(systemName: "dollarsign")
                ToolbarIcon(systemName: "compass.drawing")
                ToolbarIcon(systemName: "wrench.and.screwdriver")
                ToolbarIcon(systemName: "fork.knife.circle")
                ToolbarIcon(systemName: "bag")
                ToolbarIcon(systemName: "text.bubble")
                ToolbarIcon(systemName: "magnifyingglass.circle")

            }
            .padding(.leading, 60) // Adjust the value based on your needs
        }
        .offset(x: isExpanded ? 0 : 150) // Move the expanded toolbar to the right
        .onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

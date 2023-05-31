//
//  ContentView.swift
//  TradeWinds
//
//  Created by Evan Domingos on 5/29/23.
//

import SwiftUI

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
                    } else {
                        Spacer()
                    }
                    
                    Circle()
                        .frame(width: 50, height: 50) // Set circle size
                        .foregroundColor(.blue) // Set blue circle color
                        .overlay(
                            Image(systemName: "arrow.left")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .rotationEffect(.degrees(isExpanded ? 180 : 0))
                                .onTapGesture {
                                    withAnimation {
                                        isExpanded.toggle()
                                    }
                                }
                        )
                }
                .alignmentGuide(HorizontalAlignment.trailing) { _ in
                    UIScreen.main.bounds.size.width - 60 // Adjust the value based on your needs
                }
            }
        }
    }
}

struct ExpandedToolbarView: View {
    @Binding var isExpanded: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: isExpanded ? 20 : 25)
            .foregroundColor(.blue)
            .frame(height: 50)
            .overlay(
                HStack(spacing: 10) {
                    ToolbarIcon(systemName: "cloud.sun")
                    ToolbarIcon(systemName: "dollarsign")
                    ToolbarIcon(systemName: "compass.drawing")
                    ToolbarIcon(systemName: "wrench.and.screwdriver")
                    ToolbarIcon(systemName: "bag")
                }
                .padding()
            )
            .offset(x: isExpanded ? -150 : 0) // Move the expanded toolbar to the left
            
            .animation(.easeInOut)
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

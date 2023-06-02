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
    @State private var isCollapsed = false
    
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
                
                if isCollapsed {
                    CollapsedToolbarView(isCollapsed: $isCollapsed)
                } else {
                    ExpandedToolbarView(isExpanded: $isExpanded)
                        .transition(.move(edge: .leading))
                }
                
                Spacer() // Add spacer for proper alignment
                
                if !isExpanded {
                    CircleButton(isCollapsed: $isCollapsed)
                }
            }
            .padding(.trailing, 20) // Adjust the value based on your needs
        }
    }
}

struct ExpandedToolbarView: View {
    @Binding var isExpanded: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Capsule(style: .continuous)
                .foregroundColor(.blue)
                .frame(height: 50)
                .padding(.trailing, 50) // Adjust the value based on your needs
            
            HStack(spacing: 10) {
                ToolbarIcon(systemName: "cloud.sun")
                ToolbarIcon(systemName: "dollarsign")
                ToolbarIcon(systemName: "compass.drawing")
                ToolbarIcon(systemName: "wrench.and.screwdriver")
                ToolbarIcon(systemName: "bag")
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
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

struct CollapsedToolbarView: View {
    @Binding var isCollapsed: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            ToolbarIcon(systemName: "cloud.sun")
            ToolbarIcon(systemName: "dollarsign")
            //ToolbarIcon(systemName: "")
            ToolbarIcon(systemName: "compass.drawing")
            ToolbarIcon(systemName: "wrench.and.screwdriver")
            ToolbarIcon(systemName: "bag")
            
            Image(systemName: "arrow.right")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .onTapGesture {
                    withAnimation {
                        isCollapsed.toggle()
                    }
                }
                .padding(.leading, 10) // Adjust the value based on your needs
            
            Spacer()
        }
        .padding(.horizontal, 20) // Adjust the value based on your needs
        .frame(height: 50)
        .background(Color.blue)
        .cornerRadius(25)
    }
}

struct CircleButton: View {
    @Binding var isCollapsed: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                isCollapsed.toggle()
            }
        }) {
            Circle()
                            .frame(width: 50, height: 50) // Set circle size
                            .foregroundColor(.blue) // Set blue circle color
                            .overlay(
                                Image(systemName: isCollapsed ? "arrow.right" : "arrow.left")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                            )
                    }
                }
            }

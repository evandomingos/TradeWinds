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

                Rectangle()
                    .frame(height: 50) // Set toolbar ribbon height
                    .foregroundColor(.black) // Set black toolbar color
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2) // Set white outline
                    )
                    .padding(.horizontal)
                    .overlay(
                        HStack {
                            Spacer()
                            ToolbarIcon(systemName: "cloud.sun")
                           Spacer()
                            ToolbarIcon(systemName: "dollarsign")
                            Spacer()
                            ToolbarIcon(systemName: "compass.drawing")
                            Spacer()
                            ToolbarIcon(systemName: "wrench.and.screwdriver")
                            Spacer()
                            ToolbarIcon(systemName: "bag")
                        }
                    )
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
            .font(.system(size: 40))
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
                            ToolbarIcon(systemName: "cloud.sun")
                           // Spacer()
                            ToolbarIcon(systemName: "dollar.sign.square")
                            //Spacer()
                            ToolbarIcon(systemName: "compass.drawing")
                            //Spacer()
                            ToolbarIcon(systemName: "wrench.and.screwdriver.fill")
                         //   Spacer()
                            ToolbarIcon(systemName: "bag")
                            Spacer()
                           
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

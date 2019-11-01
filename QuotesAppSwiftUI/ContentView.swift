//
//  ContentView.swift
//  QuotesAppSwiftUI
//
//  Created by Minhajul Russell on 11/1/19.
//  Copyright © 2019 russell. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CircleImage(imageName: "lilly")
                .frame(width: 160, height: 160)
                .padding(.top, 90)
                .padding(.bottom, 20)
            MainView()
            Spacer()
        }.background(Image("motivation_bg")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all))
    }
}

struct MainView: View {
    
    let quotes = ["quote1", "quote2", "quote3", "quote4", "quote5", "quote6", "quote7", "quote8", "quote9"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Quotes Available")
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.orange)
            } // MARK: - HStack Ends Here
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.quotes, id: \.self) {
                        quotes in
                        VStack {
                            CircleImage(imageName: "lilly")
                            Text(quotes)
                            Divider()
                            Text("By: James Bond")
                                .italic()
                                .font(.custom("Helvetica neue", size: 14))
                        }.frame(width: 300, height: 300)
                            .foregroundColor(.gray)
                            .padding(.all, 4)
                            .background(Color.white)
                        .cornerRadius(12)
                            .overlay(Rectangle()
                                .fill( LinearGradient(gradient: Gradient(colors: [.clear, .pink]), startPoint: .center, endPoint: .topLeading))
                                .clipped()
                                .shadow(radius: 8))
                    }
                }
            }
            
        }
    }
}

struct CircleImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            .shadow(radius: 10)
            .frame(width: 100, height: 100)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

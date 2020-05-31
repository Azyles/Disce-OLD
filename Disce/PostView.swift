//
//  PostView.swift
//  Disce
//
//  Created by Kushagra Singh on 5/30/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct EffectsView: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        return NSVisualEffectView()
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        var visualEffect: NSVisualEffectView!
        visualEffect = NSVisualEffectView()
        visualEffect.translatesAutoresizingMaskIntoConstraints = false
        visualEffect.material = .light
        visualEffect.state = .active
        visualEffect.blendingMode = .behindWindow
        
    }
}


struct PostView: View {
    var book: ActivityCard
    var body: some View {
        ZStack {
            EffectsView()
            ScrollView{
                WebImage(url: URL(string: book.imageURL))
                .onSuccess { image, data, cacheType in
                }
                .resizable()
                .placeholder(Image("loading"))
                .indicator(.activity)
                .animation(.easeInOut(duration: 0.5))
                .transition(.fade)
                .scaledToFill()
                .frame(width: 700, height: 200)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 0, green: 0, blue: 0, opacity: 1), lineWidth: 0))
                HStack{
                    Text(book.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 50.0)
                    Spacer()
                }
                .padding(.top, 15.0)
                HStack{
                    Text(book.summary)
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color.blue)
                        .padding(.leading, 50.0)
                        .frame(width: 400.0,alignment: .leading)
                    Spacer()
                }
                .padding(.top, 15.0)
                HStack{
                    Text(book.content)
                        .font(.body)
                        .fontWeight(.regular)
                        .padding(.leading, 50.0)
                        .frame(width: 700.0,alignment: .leading)
                    Spacer()
                }
                .padding(.top, 15.0)
                Spacer()
                
            }.padding(.top, 30.0).frame(width: 800, height: 600, alignment: .center)
        }
    }
}

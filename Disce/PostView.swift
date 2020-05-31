//
//  PostView.swift
//  Disce
//
//  Created by Kushagra Singh on 5/30/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    var body: some View {
        ScrollView{
            WebImage(url: URL(string: "https://car-images.bauersecure.com/pagefiles/86633/f8_tributo_053.jpg"))
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
                Text("How to drive faster")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 50.0)
                Spacer()
            }
            .padding(.top, 15.0)
            HStack{
                Text("How to drive faster")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(Color.blue)
                    .padding(.leading, 50.0)
                    .frame(width: 400.0,alignment: .leading)
                Spacer()
            }
            .padding(.top, 15.0)
            HStack{
                Text("How to drive faster")
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

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}

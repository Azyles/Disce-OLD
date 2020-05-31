//
//  ProfileScreen.swift
//  Disce
//
//  Created by Kushagra Singh on 5/30/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileScreen: View {
    var body: some View {
        ZStack{
            VStack {
                WebImage(url: URL(string: "https://preppywallpapers.com/wp-content/uploads/2019/01/header2.jpg"))
                    .onSuccess { image, data, cacheType in
                }
                .resizable()
                .frame(width: 800, height: 200)
                Spacer()
            }
            VStack{
                WebImage(url: URL(string: "https://avatars0.githubusercontent.com/u/56901151?s=460&u=b73775bdb91fcc2c59cb28b066404f3b6b348262&v=4"))
                    .onSuccess { image, data, cacheType in
                }
                .resizable()
                .clipShape(Circle())
                .frame(width: 150, height: 150)
                
                Text("Jeff Kiney")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.top)
                Text("Head Developer of Azyles")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Follow")
                        .fontWeight(.bold)
                        .frame(width: 100)
                }
                HStack{
                    
                    VStack(){
                        Text("10")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Text("Posts")
                            .font(.system(size: 10))
                        
                    }
                    .padding(.trailing, 75)
                    
                    Divider()
                        .frame(height: 30)
                    
                    VStack(){
                        Text("35")
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Text("Likes")
                            .font(.system(size: 10))
                        
                    }.padding(.leading, 75.0)}
                    .padding(.top)
                Spacer()
            }
            .padding(.top, 100.0)
        }.frame(width: 800, height: 600)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

//
//  HomeView.swift
//  
//
//  Created by Kushagra Singh on 5/29/20.
//

import SwiftUI
import SDWebImageSwiftUI



struct HomeView: View {
    @ObservedObject var viewModel = BooksViewModel()
    var body: some View {
        VStack{
            HStack{
                Text("For U")
                .font(.subheadline)
                .fontWeight(.regular)
                    .padding(.leading, 50.0)
                Text("Trending")
                .font(.subheadline)
                .fontWeight(.regular)
                    .padding(.leading, 30.0)
                Text("Following")
                .font(.subheadline)
                .fontWeight(.regular)
                    .padding(.leading, 30.0)
                Text("Saved")
                .font(.subheadline)
                .fontWeight(.regular)
                    .padding(.horizontal, 30.0)
                TextField(" Search", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding(.trailing, 50.0)
                Spacer()
            }
            .padding(.top, 30.0)
            
            Divider()
                .padding([.leading, .bottom, .trailing], 40.0)
            List(viewModel.books) { book in // (2)
                WebImage(url: URL(string: book.imageURL))
                  .onSuccess { image, data, cacheType in
                  }
                  .resizable()
                  .indicator(.activity)
                  .animation(.easeInOut(duration: 0.5))
                  .transition(.fade)
                  .scaledToFill()
                  .overlay(RoundedRectangle(cornerRadius: 10)
                  .stroke(Color.white, lineWidth: 4))
                  .frame(width: 300.0, height: 300.0,alignment: .center)
              
            }
            .onAppear() { // (3)
              self.viewModel.fetchData()
            }
            
            Spacer()
        }.padding(.bottom).frame(width: 800, height: 600)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

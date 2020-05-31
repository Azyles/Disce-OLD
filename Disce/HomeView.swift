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
        NavigationView {
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
                List(viewModel.books) { book in
                    NavigationLink(destination: PostView(book:book)) {
                        HStack {
                            Spacer()
                            WebImage(url: URL(string: book.imageURL))
                                .onSuccess { image, data, cacheType in
                                }
                                .resizable()
                                .indicator(.activity)
                                .animation(.easeInOut(duration: 0.5))
                                .transition(.fade)
                                .scaledToFill()
                            .frame(width: 700.0, height: 300.0,alignment: .center)
                            Spacer()
                        }
                        .padding(.all)
                        
                    }.onTapGesture(count: 1) {
                        let controller = DetailWindowController(rootView: PostView(book: book))
                        controller.window?.title = book.title
                        controller.showWindow(nil)
                    
                }
                }
                .onAppear() { // (3)
                  self.viewModel.fetchData()
                }
                Spacer()
            }.frame(width: 800, height: 600)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

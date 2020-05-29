//
//  HomeView.swift
//  
//
//  Created by Kushagra Singh on 5/29/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            HStack{
                    Text("Disce")
            }
            Spacer()
        }.frame(width: 800, height: 600)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

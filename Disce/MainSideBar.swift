//
//  MainSideBar.swift
//  Disce
//
//  Created by Kushagra Singh on 5/29/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//

import SwiftUI

struct MainSideBar: View {
    var body: some View {
        List{
            NavigationLink(destination: HomeView()) {
                Text("Home")
            }
            NavigationLink(destination: UploadView()) {
                Text("Home")
            }
        }
        .listStyle(SidebarListStyle())
        .frame(width: 150, height: 600)
    }
}

struct MainSideBar_Previews: PreviewProvider {
    static var previews: some View {
        MainSideBar()
    }
}

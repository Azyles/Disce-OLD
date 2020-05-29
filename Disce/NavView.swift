//
//  NavView.swift
//  Disce
//
//  Created by Kushagra Singh on 5/29/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        NavigationView{
            HStack{
                MainSideBar()
            }
        }
    .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}

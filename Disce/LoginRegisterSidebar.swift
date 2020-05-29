//
//  LoginRegisterSidebar.swift
//  Disce
//
//  Created by Kushagra Singh on 5/29/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//

import SwiftUI

struct LoginRegisterSidebar: View {
    var body: some View {
        List{
            NavigationLink(destination: SignUpView()) {
                Text("SignUp")
            }
            NavigationLink(destination: SignInView()) {
                Text("SignIn")
            }
        }.listStyle(SidebarListStyle())
    }
}

struct LoginRegisterSidebar_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterSidebar()
    }
}

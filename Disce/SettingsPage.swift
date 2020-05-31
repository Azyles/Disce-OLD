//
//  SettingsPage.swift
//  Disce
//
//  Created by Kushagra Singh on 5/30/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//

import SwiftUI
import Firebase

struct SettingsPage: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack{
            HStack {
                Text("Settings")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.leading, 50.0)
                Spacer()
            }
            .padding(.top, 20.0)
            Divider()
                .padding(.horizontal)
            List{
                Text("Reset Password")
                Text("DarkMode Toggle")
                Button(action: session.signOut) {
                    Text("Logout")
                    .foregroundColor(Color.red)
                }.buttonStyle(PlainButtonStyle())
            }
            Spacer()
        }.frame(width: 800, height: 600)
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}

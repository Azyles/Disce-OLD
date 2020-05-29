//
//  AuthView.swift
//  Disce
//
//  Created by Kushagra Singh on 5/29/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signIn(){
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack{
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 20.0)
            }
            VStack(spacing: 18){
                TextField("Email Address", text: $email).font(.system(size: 14))
                    .padding(.horizontal, 20.0)
                SecureField("Password", text: $password)
                    .font(.system(size: 14))
                 .padding(.horizontal, 20.0)
            }
            .padding(.top, 40.0)
            
            Button(action: signIn) {
                Text("Sign In")
                
            }
            .padding([.top, .leading, .trailing], 20.0)
            
            if(error != "") {
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.top)
            }
            
            Spacer()
            
        }
        .padding(.horizontal, 20.0)
        .frame(width: 500, height: 400)
    }
}

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp(){
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            
            HStack{
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.leading, 20.0)

            }
            VStack(spacing: 20){
                TextField("Email Address", text: $email).font(.system(size: 14))
                    .padding(.horizontal, 20.0)
                SecureField("Password", text: $password)
                    .font(.system(size: 14))
                 .padding(.horizontal, 20.0)
            }
            .padding(.top, 40.0)
            
            Button(action: signUp) {
                Text("Sign Up")
            }
            .padding([.top, .leading, .trailing], 20.0)
            
            if(error != "") {
                Text(error)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.top)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20.0)
    .frame(width: 500, height: 400)
    }
}

struct AuthView: View {
    var body: some View {
        NavigationView{
            LoginRegisterSidebar()
            SignUpView()
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView().environmentObject(SessionStore())
    }
}

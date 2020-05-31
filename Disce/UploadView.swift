//
//  UploadView.swift
//  Disce
//
//  Created by Kushagra Singh on 5/29/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import SDWebImageSwiftUI


struct BlueButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.blue : Color.white)
            .background(configuration.isPressed ? Color.white : Color.blue)
            .cornerRadius(6.0)
            .padding()
    }
}

struct UploadView: View {
    
    @State var title = ""
    @State var imageURL = ""
    @State var summary = ""
    @State var content = ""
    
    var body: some View {
        ScrollView {
            VStack{
                Group{
                    HStack {
                        Text("Upload")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.leading, 50.0)
                        Spacer()
                    }
                    .padding(.top, 20.0)
                    Divider()
                        .padding(.horizontal)
                    HStack {
                        Text("Title")
                            .font(.headline)
                            .fontWeight(.regular)
                            .padding(.horizontal, 50.0)
                        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $title)
                            .padding(.trailing, 100.0)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                    }
                    .padding(.top, 20.0)
                    HStack {
                        Text("Image Url")
                            .font(.headline)
                            .fontWeight(.regular)
                            .padding(.horizontal, 50.0)
                        TextField("Placeholder", text: $imageURL)
                            .padding(.trailing, 100.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                    }
                    .padding(.top, 20.0)
                    HStack {
                        Text("Summary")
                            .font(.headline)
                            .fontWeight(.regular)
                            .padding(.horizontal, 50.0)
                        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $summary)
                            .padding(.trailing, 100.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                    }
                    .padding(.top, 20.0)
                    HStack {
                        Text("Content")
                            .font(.headline)
                            .fontWeight(.regular)
                            .padding(.horizontal, 50.0)
                        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $content)
                            .padding(.trailing, 100.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        Spacer()
                    }
                    .padding(.top, 20.0)
                    Button(action: {

                        let postDictionary = [
                            "title":self.title,
                            "imageURL":self.imageURL,
                            "summary":self.summary,
                            "content":self.content
                        ]
                        
                        let docRef = Firestore.firestore().document("Posts/\(UUID().uuidString)")
                        print("setting data")
                        docRef.setData(postDictionary, merge: true){ (error) in
                            if let error = error {
                                print("error = \(error)")
                            } else {
                                print("data updated successfully")
                                self.title = ""
                                self.imageURL = ""
                                self.summary = ""
                                self.content = ""
                            }
                        }

                    }) {
                        HStack {
                            Text("Submit")
                                .padding(.vertical, 5.0)
                        }
                        .padding(.horizontal, 50.0)
                    }.buttonStyle(BlueButtonStyle())
                }
                Group{
                    HStack {
                        Text("Preview")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.leading, 50.0)
                        Spacer()
                    }
                    .padding(.top, 50.0)
                    Divider()
                        .padding([.leading, .bottom, .trailing])
                    
                    Section {
                        WebImage(url: URL(string: imageURL))
                            .onSuccess { image, data, cacheType in
                            }
                            .resizable()
                            .indicator(.activity)
                            .animation(.easeInOut(duration: 0.5))
                            .transition(.fade)
                            .scaledToFill()
                            .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0))
                            .frame(width: 600.0, height: 300.0,alignment: .center)
                        
                    }
                    .padding(.top, 30.0)
                    HStack {
                        Text(title)
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(.leading, 50.0)
                        Spacer()
                    }
                    .padding(.top, 40.0)
                    HStack {
                        Text(summary)
                            .font(.callout)
                            .fontWeight(.regular)
                            .padding(.horizontal, 50.0)
                        Spacer()
                    }
                    .padding(.top, 20.0)
                    HStack {
                        Text(content)
                            .font(.body)
                            .fontWeight(.regular)
                            .padding(.horizontal, 50.0)
                        Spacer()
                    }
                    .padding(.top, 5.0)
                    
                }
                Spacer()
            }
        }.padding(.bottom).frame(width: 800, height: 600)
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}

//
//  GridCard.swift
//  Disce
//
//  Created by Kushagra Singh on 5/30/20.
//  Copyright © 2020 PolyNexus. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import SDWebImageSwiftUI
import Foundation

struct ActivityCard: Identifiable {
    var id = UUID()
    var title:String
    var imageURL:String
    var summary:String
    var content:String
}

class BooksViewModel: ObservableObject {
  @Published var books = [ActivityCard]()
  
  private var db = Firestore.firestore()
  
  func fetchData() {
    db.collection("Posts").addSnapshotListener { (querySnapshot, error) in
      guard let documents = querySnapshot?.documents else {
        print("No documents")
        return
      }

      self.books = documents.map { queryDocumentSnapshot -> ActivityCard in
        let data = queryDocumentSnapshot.data()
        let title = data["title"] as? String ?? ""
        let imageURL = data["imageURL"] as? String ?? ""
        let summary = data["summary"] as? String ?? ""
        let content = data["content"] as? String ?? ""

        return ActivityCard(id: .init(), title: title, imageURL: imageURL, summary: summary, content: content)
      }
    }
  }
}

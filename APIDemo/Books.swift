//
//  Books.swift
//  APIDemo
//
//  Created by Adesh Shah on 2023-10-08.
//

import Foundation

//https://raw.githubusercontent.com/shah0150/learningGit/master/test.json

struct Book: Codable, Identifiable {
    let id = UUID()
    var author: String
    var email: String
    var title: String
}

class Api : ObservableObject{
    @Published var books = [Book]()
    
    func loadData(completion:@escaping ([Book]) -> ()) {
        guard let url = URL(string: "https://raw.githubusercontent.com/shah0150/learningGit/master/test.json") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let books = try! JSONDecoder().decode([Book].self, from: data!)
            print(books)
            DispatchQueue.main.async {
                completion(books)
            }
        }.resume()
        
    }
}

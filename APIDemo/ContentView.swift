//
//  ContentView.swift
//  APIDemo
//
//  Created by Adesh Shah on 2023-10-07.
//

import SwiftUI
struct ContentView: View {
    
    @State var books = [Book]()
    
    var body: some View {
        NavigationStack{
            List(books) { book in
                VStack(alignment: .leading) {
                    Text("\(book.title)")
                        .font(.title)
                        .foregroundColor(.red)
                        .padding(.bottom)
                    
                    
                    HStack{
                        Text("\(book.author)")
                            .font(.body)
                            .fontWeight(.bold)
                            Spacer()
                        Text("\(book.email)")
                            .font(.body)
                            .fontWeight(.semibold)
                    }
    //                Spacer()
                }.swipeActions{
                    Button(action: {
                        print("Added to Fav")
                    }, label: {
                        Label("Favorite", systemImage: "star.fill")
                    }).tint(.green)
                }
                
            }
                .onAppear() {
                    Api().loadData { (books) in
                        self.books = books
                    }
                }.navigationTitle("Book List").listStyle(.inset).refreshable {
                    print("Refreshed")
                }
        }
    }
}

#Preview {
    ContentView()
}

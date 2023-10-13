//
//  SwiftUIView.swift
//  APIDemo
//
//  Created by Adesh Shah on 2023-10-12.
//

import SwiftUI

struct SwiftUIView: View {
    @State var showSheet: Bool = false
    var body: some View {
        Button("Click me"){
            showSheet.toggle()
        }.sheet(isPresented: $showSheet){
            myNewView()
                .presentationDetents([.medium, .large])
//                .interactiveDismissDisabled()
        }
    }
}

struct myNewView: View {
    var body: some View {
        ZStack{
            Color.green.ignoresSafeArea()
            Text("Pay your dues")
        }
    }
}

#Preview {
    SwiftUIView()
}

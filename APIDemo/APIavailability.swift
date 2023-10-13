//
//  APIavailability.swift
//  APIDemo
//
//  Created by Adesh Shah on 2023-10-12.
//

import SwiftUI

struct APIavailability: View {
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass

    var body: some View {
        if vSizeClass == .regular && hSizeClass == .compact {
                   print("device is probably in portrait orientation")
               } else {
                   print("device is probably in landscape orientation")
               }
    }
}

#Preview {
    APIavailability()
}

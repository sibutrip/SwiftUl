//
//  SwiftUIView.swift
//  
//
//  Created by Tom Phillips on 4/6/23.
//

import SwiftUI

struct Button<Label>: View where Label : View {

    init(action: () -> Void, label: () -> Label) {}
    
    var body: some View {
        Image("button", bundle: Bundle.module)
            .resizable()
            .scaledToFit()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            // Do something
        } label: {
            Image("FUCK")
        }
    }
}

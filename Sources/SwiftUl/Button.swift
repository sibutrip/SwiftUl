//
//  SwiftUIView.swift
//  
//
//  Created by Tom Phillips on 4/6/23.
//

import SwiftUI

struct Button<Label>: View where Label : View {
    var imageName = "button"
    var isCancel = false
    var body: some View {
        ZStack {
            Image(imageName, bundle: Bundle.module)
                .resizable()
            .scaledToFit()
            
            if isCancel {
                Image("cancel-x", bundle: Bundle.module)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.2)
            }
        }
            
    }
}

extension Button {
    init(action: () -> Void, label: () -> Label) {}
    
    init(_ titleKey: LocalizedStringKey, action: () -> Void) {}
    
    init<S>(
        _ title: S,
        action: @escaping () -> Void
    ) where S : StringProtocol {}
    
    init(
        role: ButtonRole?,
        action: @escaping () -> Void,
        label: () -> Label
) {
        if role == .destructive {
            imageName = "broken-button"
        }
    
        if role == .cancel {
            isCancel = true
        }
    }
    
    init(
        _ titleKey: LocalizedStringKey,
        role: ButtonRole?,
        action: @escaping () -> Void
    ) {
        if role == .destructive {
            imageName = "broken-button"
        }
    
        if role == .cancel {
            isCancel = true
        }
    }
    
    init<S>(
        _ title: S,
        role: ButtonRole?,
        action: @escaping () -> Void
    ) where S : StringProtocol {
        if role == .destructive {
            imageName = "broken-button"
        }
    
        if role == .cancel {
            isCancel = true
        }
    }
    
    init(_ configuration: PrimitiveButtonStyleConfiguration) {}
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Button(role: .cancel) {
            // Do something
        } label: {
            Image("FUCK")
        }
        

    }
}

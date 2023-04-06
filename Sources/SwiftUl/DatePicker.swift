//
//  File.swift
//  
//
//  Created by Cory Tripathy on 4/6/23.
//

import Foundation
import SwiftUI

public struct DateFruit: Identifiable {
    public let id = UUID()
    let imageName = "dateFruit"
    var offsets: (CGFloat,CGFloat) = {
        (CGFloat.random(in: -100...100),CGFloat.random(in: -200...0))
    }()
    
}

public struct DatePicker: View {
    
    public init(_ amount: Int) {
        dates = (0..<amount).map {_ in
            .init()
        }
    }
    
    @State var dates: [DateFruit]
    @State var offset = CGSize()
    public var body: some View {
        ZStack {
            VStack {
                Image("tree", bundle: Bundle.module)
                    .resizable()
                    .scaledToFit()
                Image("basket", bundle: Bundle.module)
                    .resizable()
                    .scaledToFit()
            }
            ZStack {
                ForEach(0..<dates.count, id: \.self) { index in
                    Image("fruit", bundle: Bundle.module)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .offset(x: dates[index].offsets.0, y: dates[index].offsets.1)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    dates[index].offsets.0 = gesture.location.x
                                    dates[index].offsets.1 = gesture.location.y
                                }
                        )
                }
            }
        }
    }
}

struct DatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker(5)
    }
}


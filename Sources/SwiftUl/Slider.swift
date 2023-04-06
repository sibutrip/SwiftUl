//
//  Slider.swift
//  
//
//  Created by Cory Tripathy on 4/6/23.
//

import Foundation
import SwiftUI

public struct SliderView: View {
    public var body: some View {
        Image("slider", bundle: Bundle.module)
            .resizable()
            .frame(width: 75, height: 75)
            .offset(x: CGFloat.random(in: -150...150), y: CGFloat.random(in: -150...150))
    }
}
public struct Slider: View {
    public init() { }
    @State private var numberOfSliders = 5
    @State private var offset = CGFloat(0)
    @State private var isEditing = false
    public var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 4)
                Image("slider", bundle: Bundle.module)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .offset(x: offset, y: 0)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                offset = value.location.x - 75
                                print(offset)
                                print(geo.size.width)
                                numberOfSliders = Int(geo.size.width + value.location.x) / 30
                            }
                    )
                ForEach(0..<Int(numberOfSliders), id: \.self) {_ in
                    SliderView()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Slider()
    }
}

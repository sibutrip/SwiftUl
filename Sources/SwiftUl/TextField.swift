//
//  File.swift
//  
//
//  Created by Zoe Cutler on 4/6/23.
//

import SwiftUI

internal struct TextFieldComponent: Identifiable {
    var id = UUID()
    var text: String
    var offset: CGSize
}

public struct TextField: View {
    var title: String
    @Binding var text: String
    
    @State private var textComponents: [TextFieldComponent] = []
    
    public init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("field", bundle: Bundle.module)
                    .resizable()
                    .overlay {
                        HStack {
                            SwiftUI.TextField(title, text: $text)
                                .textFieldStyle(.roundedBorder)
                                .onChange(of: text) { newValue in
                                    if newValue != "" {
                                        let offset = CGSize(width: (geometry.size.width / 2) * CGFloat.random(in: -1...1), height: (geometry.size.height / 2) * CGFloat.random(in: -1...1))
                                        let newComponent = TextFieldComponent(text: newValue, offset: offset)
                                        textComponents.append(newComponent)
                                        text = ""
                                    }
                                }
                            
                            if !textComponents.isEmpty {
                                Button {
                                    textComponents = []
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.primary)
                                }
                            }
                        }
                        .padding()
                    }
                
                ForEach(textComponents) { component in
                    Text(component.text)
                        .font(.title3)
                        .foregroundColor(.green)
                        .padding(5)
                        .background {
                            Circle()
                                .colorInvert()
                        }
                        .offset(component.offset)
                }
            }
        }
    }
}

extension TextField {
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, axis: Axis) {
        self.title = Mirror(reflecting: titleKey).children.first(where: { $0.label == "key" })?.value as? String ?? ""
        self._text = text
    }
    
    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?, axis: Axis) {
        self.title = Mirror(reflecting: titleKey).children.first(where: { $0.label == "key" })?.value as? String ?? ""
        self._text = text
    }

    public init<S>(_ title: S, text: Binding<String>, axis: Axis) where S : StringProtocol {
        self.title = title.decomposedStringWithCanonicalMapping
        self._text = text
    }

    public init<S>(_ title: S, text: Binding<String>, prompt: Text?, axis: Axis) where S : StringProtocol {
        self.title = title.decomposedStringWithCanonicalMapping
        self._text = text
    }

    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, prompt: Text?) {
        self.title = Mirror(reflecting: titleKey).children.first(where: { $0.label == "key" })?.value as? String ?? ""
        self._text = text
    }

    public init<S>(_ title: S, text: Binding<String>, prompt: Text?) where S : StringProtocol {
        self.title = title.decomposedStringWithCanonicalMapping
        self._text = text
    }

    public init(_ titleKey: LocalizedStringKey, text: Binding<String>) {
        self.title = Mirror(reflecting: titleKey).children.first(where: { $0.label == "key" })?.value as? String ?? ""
        self._text = text
    }

    public init<S>(_ title: S, text: Binding<String>) where S : StringProtocol {
        self.title = title.decomposedStringWithCanonicalMapping
        self._text = text
    }

    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void, onCommit: @escaping () -> Void) {
        self.title = Mirror(reflecting: titleKey).children.first(where: { $0.label == "key" })?.value as? String ?? ""
        self._text = text
    }

    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void) {
        self.title = Mirror(reflecting: titleKey).children.first(where: { $0.label == "key" })?.value as? String ?? ""
        self._text = text
    }

    public init(_ titleKey: LocalizedStringKey, text: Binding<String>, onCommit: @escaping () -> Void) {
        self.title = Mirror(reflecting: titleKey).children.first(where: { $0.label == "key" })?.value as? String ?? ""
        self._text = text
    }

    public init<S>(_ title: S, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void, onCommit: @escaping () -> Void) where S : StringProtocol {
        self.title = title.decomposedStringWithCanonicalMapping
        self._text = text
    }

    public init<S>(_ title: S, text: Binding<String>, onEditingChanged: @escaping (Bool) -> Void) where S : StringProtocol {
        self.title = title.decomposedStringWithCanonicalMapping
        self._text = text
    }

    public init<S>(_ title: S, text: Binding<String>, onCommit: @escaping () -> Void) where S : StringProtocol {
        self.title = title.decomposedStringWithCanonicalMapping
        self._text = text
    }
}

internal struct TextFieldTest: View {
    @State private var name = ""
    
    var body: some View {
        TextField("Name", text: $name)
    }
}

internal struct TextFieldTest_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldTest()
    }
}

//
//  ContentView.swift
//  HitTestDemo
//
//  Created by Matt Curtis on 12/22/21.
//

import SwiftUI

struct NonInteractiveRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let uiView = UIView()
        
        uiView.isUserInteractionEnabled = false
        
        return uiView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
    
}

struct ContentView: View {
    
    var body: some View {
        Color.red
            .onTapGesture {
                //  As long as the UIViewRepresentable is overlaying this view,
                //  this will never be printed:
                
                print("SwiftUI onTapGesture fired!")
            }
            .overlay(NonInteractiveRepresentable())
    }
    
}

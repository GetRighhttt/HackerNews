//
//  Splash.swift
//  HackerNews
//
//  Created by Stefan Bayne on 11/16/22.
//

import SwiftUI

struct Splash: View {
    
    /*
     Tells wether splashscreen is active or not
     */
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var isRotated = false
    
    var body: some View {
        if isActive {
            LoginView()
        } else {
            ZStack {
                Color("BrownTint").ignoresSafeArea()
                VStack {
                    VStack {
                        Image(systemName: "newspaper")
                            .font(.system(size: 40))
                            .foregroundColor(Color("Beige"))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.9)) {
                            self.size = 2.8
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.easeOut(duration: 0.8)) {
                            self.isActive = true
                        }
                        self.isActive = true
                    }
                }
            }
            
        }
        
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}

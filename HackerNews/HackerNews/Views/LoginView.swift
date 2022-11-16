//
//  LoginView.swift
//  HackerNews
//
//  Created by Stefan Bayne on 11/16/22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = ViewModel()
    @State private var showAlert = false
    
    var body: some View {
        
        /*
         Checks wether or not the user is aunthenticated.
         Displays the screen based on the boolean variable.
         */
        if viewModel.authenticated {
            ContentView()
        } else {
            /*
             If user is validated, this stack shows.
             */
            ZStack {
                Color("BrownTint").ignoresSafeArea(.all, edges: .all) // bg
                
                VStack(spacing: 20) {
                    Text("Hacker News")
                        .font(.system(size: 50))
                        .bold()
                        .foregroundColor(Color("Beige"))
                        .padding(.top, 60)
                        .textCase(.uppercase)
                        .shadow(radius: 5)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Login")
                            .font(.system(size: 35))
                            .bold()
                            .foregroundColor(Color("Beige"))
                            .shadow(radius: 5)
                        
                        TextField("Username", text: $viewModel.username)
                            .font(.system(size: 20))
                            .textFieldStyle(.roundedBorder)
                            .foregroundColor(Color("Beige"))
                            .font(.headline)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .textInputAutocapitalization(.never)
                        
                        SecureField("Password", text: $viewModel.password)
                            .font(.system(size: 20))
                            .foregroundColor(Color("Beige"))
                            .textFieldStyle(.roundedBorder)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .textInputAutocapitalization(.never)
                            .privacySensitive() // very important
                        
                        HStack {
                            Spacer()
                            
                            Button("Forgot Password") {
                                showAlert = true
                            }
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(Color("Beige"))
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            
                            Spacer()
                            
                        } // alert dialog box demo below
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Forgot Password:"),
                                message: Text("A link has been sent to your email."),
                                primaryButton: .default( // blue outline
                                    Text("Resend"),
                                    action: viewModel.buttonsNotUsed
                                                       ),
                                secondaryButton: .destructive( // red outline
                                    Text("Dismiss"),
                                    action: viewModel.buttonsNotUsed
                                                             )
                            )
                        }
                    }
                    
                    Spacer()
                    
                    Button("Login", action: viewModel.authenticate)
                        .frame(width: 320, height: 70)
                        .font(.system(size: 30))
                        .foregroundColor(Color("BrownTint"))
                        .background(Color("Beige"))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.bottom, 30)
                }
                .padding()
                .alert("Access Denied", isPresented: $viewModel.invalid) {
                    Button("Dismiss", action: viewModel.buttonsNotUsed)
                }
            } // animation. The best way to do it!
            .transition(.scale)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

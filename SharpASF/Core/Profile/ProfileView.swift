//
//  ProfileView.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/20/24.
//

import SwiftUI

struct ProfileView: View {
    var data: ProfileData
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle.bold())
                    Text("Log in nto start planning your next trip.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
                // MARK: - Log in button
                Button(action: {
                    // action...
                }, label: {
                    Text("Log in")
                        .modifier(ButtonModifier(buttonHeight: 44, buttonCorner: 8, backgroundColor: .pink, foregroundColor: .white))
                })
                
                // MARK: - Sign up
                HStack {
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .padding(.bottom)
                .font(.caption)
            }
            
            VStack(spacing: 24) {
                ForEach(ProfileSettingsData, id:\.text) { item in
                    ProfileOptionRowView(imageName: item.icon, title: item.text)
                }
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView(data: ProfileData.init(icon: "gear", text: "settings"))
}

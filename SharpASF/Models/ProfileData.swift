//
//  ProfileData.swift
//  SharpASF
//
//  Created by SEAN BLAKE on 1/20/24.
//

import SwiftUI

struct ProfileData {
    var icon: String
    var text: String
}

let ProfileSettingsData: [ProfileData] = [
    ProfileData(icon: "slider.vertical.3", text: "Edit Profile"),
    ProfileData(icon: "accessibility", text: "Accessiblity"),
    ProfileData(icon: "gear", text: "App Settings"),
    ProfileData(icon: "questionmark.circle", text: "Visit the help center.")
]

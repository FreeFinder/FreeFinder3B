// Copy of main file
//  main.swift
//  FreeFinderMilestone3B
//
//  Created by Charlie Gravitt on 11/2/22.
//

import Foundation
import SwiftUI
//import GoogleSignIn
import MapKit



func sign_in(email: String) async -> User?{
    if email.hasSuffix("@uchicago.edu"){
        return await User(email: email)
    }
    return nil;
}

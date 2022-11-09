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

let user1 = await User(email: "mongodb@gmail.com");
let observer = await AppData(user: user1);

func sign_in(email: String) async -> User?{
    if email.hasSuffix("@uchicago.edu"){
        return await User(email: email)
    }
    return nil;
}

let appDelegateClass: AnyClass = NSClassFromString("AppDelegate") ?? AppDelegate.self
UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(appDelegateClass))

//dispatchMain();



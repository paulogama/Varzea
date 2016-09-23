//
//  AppDelegate.h
//  Varzea
//
//  Created by Paulo Gama on 9/19/16.
//  Copyright © 2016 Paulo Gama. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <GoogleSignIn/GoogleSignIn.h>

@import Firebase;

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

@end


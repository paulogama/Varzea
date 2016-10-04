//
//  FirebaseAuth.h
//  Varzea
//
//  Created by Paulo Gama on 22/09/16.
//  Copyright © 2016 Paulo Gama. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface FirebaseAuth : NSObject

+ (void)authenticateWithFBSDKAccessToken:(FBSDKAccessToken *)accessToken andBlock:(void(^)(BOOL success))block;
+ (void)authenticateWithGIDAuthentication:(GIDAuthentication *)authentication andBlock:(void(^)(BOOL success))block;

@end

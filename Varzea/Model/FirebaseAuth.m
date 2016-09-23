//
//  FirebaseAuth.m
//  Varzea
//
//  Created by Paulo Gama on 22/09/16.
//  Copyright © 2016 Paulo Gama. All rights reserved.
//

#import "FirebaseAuth.h"

@import Firebase;

@implementation FirebaseAuth

#warning REFATORAR BLOCK COMPLETITION
+ (void)authenticateWithFBSDKAccessToken:(FBSDKAccessToken *)accessToken andBlock:(void(^)(BOOL success))block {
    if(!accessToken)
        block(false);
    
    FIRAuthCredential *credential = [FIRFacebookAuthProvider credentialWithAccessToken:accessToken.tokenString];
    
    [FirebaseAuth signInWithFirCredential:credential andBlock:^(BOOL success) {
        block(success);
    }];
}

+ (void)authenticateWithGIDAuthentication:(GIDAuthentication *)authentication andBlock:(void(^)(BOOL success))block {
    if(!authentication)
        block(false);
    
    FIRAuthCredential *credential = [FIRGoogleAuthProvider credentialWithIDToken:authentication.idToken
                                                                     accessToken:authentication.accessToken];
    
    [FirebaseAuth signInWithFirCredential:credential andBlock:^(BOOL success) {
        block(success);
    }];
}

+ (void)signInWithFirCredential:(FIRAuthCredential *)credential andBlock:(void (^)(BOOL success))block {
    [[FIRAuth auth] signInWithCredential:credential
                              completion:^(FIRUser *user, NSError *error) {
                                  block(user && !error);
                              }];
}

@end

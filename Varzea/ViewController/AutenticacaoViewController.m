//
//  AutenticacaoViewController.m
//  Varzea
//
//  Created by Paulo Gama on 22/09/16.
//  Copyright © 2016 Paulo Gama. All rights reserved.
//

#import "AutenticacaoViewController.h"
#import "FirebaseAuth.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@import Firebase;

@interface AutenticacaoViewController ()

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *buttonEntrarFacebook;

@property (weak, nonatomic) IBOutlet UITextField *textFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSenha;
@property (weak, nonatomic) IBOutlet UIButton *buttonEntrar;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation AutenticacaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [GIDSignIn sharedInstance].uiDelegate = self;
    
}

- (IBAction)buttonEntrarAction:(id)sender {
    _buttonEntrar.hidden = YES;
    [_spinner startAnimating];
    
    [[FIRAuth auth] signInWithEmail:_textFieldEmail.text
                           password:_textFieldSenha.text
                         completion:^(FIRUser *user, NSError *error) {
                             _buttonEntrar.hidden = NO;
                             [_spinner stopAnimating];
                             
                             if(!error) {
                                 [self dismissViewControllerAnimated:YES completion:nil];
                             }
                             
                         }];
    
}

- (void)loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
              error:(NSError *)error {
    if (!error) {
        [FirebaseAuth authenticateWithFBSDKAccessToken:[FBSDKAccessToken currentAccessToken] andBlock:^(BOOL success) {
            NSLog(@"%@",[NSNumber numberWithBool:success]);
        }];
#warning TODO
    } else {
        NSLog(@"%@", error.localizedDescription);
    }
}

@end

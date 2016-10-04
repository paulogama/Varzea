//
//  NovaPeladaViewController.m
//  Varzea
//
//  Created by Paulo Gama on 03/10/16.
//  Copyright © 2016 Paulo Gama. All rights reserved.
//

#import "NovaPeladaViewController.h"

@interface NovaPeladaViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonCancelar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonSalvar;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewFoto;
@property (weak, nonatomic) IBOutlet UIButton *buttonAlterarImagem;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNome;
@property (weak, nonatomic) IBOutlet UITextField *textFieldHorario;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTelefone;

@end

@implementation NovaPeladaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)buttonCancelarAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)buttonSalvarAction:(id)sender {
}

- (IBAction)tapScreen:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)buttonAlterarImagemAction:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

@end

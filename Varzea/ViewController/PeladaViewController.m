//
//  PeladaViewController.m
//  Varzea
//
//  Created by Paulo Gama on 9/19/16.
//  Copyright © 2016 Paulo Gama. All rights reserved.
//

#import "PeladaViewController.h"
#import "DetalhesPeladaViewController.h"
#import "Pelada.h"

@import Firebase;

@interface PeladaViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorVIew;
@property (weak, nonatomic) IBOutlet UITableView *tableViewPeladas;
@property (nonatomic) FIRDatabaseReference *refPeladas;
@property (nonatomic) NSMutableArray *arrayPeladas;

@end

@implementation PeladaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _arrayPeladas = [[NSMutableArray alloc] init];
    
    _refPeladas = [[FIRDatabase database] referenceWithPath:@"peladas"];
    [_refPeladas observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        for (FIRDataSnapshot *item in snapshot.children) {
            Pelada *pelada = [[Pelada alloc] initWithFirebaseSnapshot:item.value];
            [_arrayPeladas addObject:pelada];
        }
        
        [_activityIndicatorVIew stopAnimating];
        _tableViewPeladas.hidden = NO;
        [_tableViewPeladas reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_arrayPeladas count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    Pelada *pelada = [_arrayPeladas objectAtIndex:indexPath.row];
    
    cell.textLabel.text = pelada.nome;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"TESTE"];
    cell.imageView.image = [UIImage imageNamed:@"teste"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"DetalhesPeladaSegue" sender:self];
    [_tableViewPeladas deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"DetalhesPeladaSegue"]) {
        UITableViewCell *cell = [_tableViewPeladas cellForRowAtIndexPath:_tableViewPeladas.indexPathForSelectedRow];
        
        DetalhesPeladaViewController *detalhesPeladaViewController = (DetalhesPeladaViewController *)segue.destinationViewController;
        detalhesPeladaViewController.title = cell.textLabel.text;
    }
}

@end

//
//  PeladaViewController.m
//  Varzea
//
//  Created by Paulo Gama on 9/19/16.
//  Copyright © 2016 Paulo Gama. All rights reserved.
//

#import "PeladaViewController.h"
#import "DetalhesPeladaViewController.h"

@interface PeladaViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewPeladas;

@end

@implementation PeladaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
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

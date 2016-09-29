//
//  Peladas.h
//  Varzea
//
//  Created by Paulo Gama on 28/09/16.
//  Copyright © 2016 Paulo Gama. All rights reserved.
//

#import <Foundation/Foundation.h>

@import Firebase;

@interface Pelada : NSObject

@property (nonatomic, copy, readonly) NSString *nome;

- (instancetype)initWithFirebaseSnapshot:(FIRDataSnapshot *)snapshot;

@end

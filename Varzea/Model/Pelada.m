//
//  Peladas.m
//  Varzea
//
//  Created by Paulo Gama on 28/09/16.
//  Copyright © 2016 Paulo Gama. All rights reserved.
//

#import "Pelada.h"

@implementation Pelada

- (instancetype)initWithFirebaseSnapshot:(FIRDataSnapshot *)snapshot {
    self = [super init];
    
    if(self) {
        _nome = [[snapshot valueForKey:@"nome"] copy];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    
    if(self) {
        _nome = [coder decodeObjectForKey:@"nome"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    if (self.nome) [coder encodeObject:self.nome forKey:@"nome"];
}

@end

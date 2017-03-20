//
//  MoviesDataStorageService.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "MoviesDataStorageService.h"

@implementation MoviesDataStorageService

+ (instancetype)sharedInstance {
    
    static MoviesDataStorageService *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [MoviesDataStorageService new];
    });
    
    return instance;
}



@end

//
//  TMDBMovieEntity.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "TMDBMovieEntity.h"

@implementation TMDBMovieEntity

+ (JSONKeyMapper *)keyMapper {
    
    return [JSONKeyMapper baseMapper:[JSONKeyMapper mapperForSnakeCase]
           withModelToJSONExceptions:@{
                                       @"identifier": @"id"
                                       }];
    
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    
    if ([propertyName isEqualToString:@"genres"]) {
        return YES;
    }
    
    if ([propertyName isEqualToString:@"genreIds"]) {
        return YES;
    }
    
    return NO;
}

@end

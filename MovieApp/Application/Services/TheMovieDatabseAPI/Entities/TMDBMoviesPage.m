//
//  TMDBMoviesPage.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "TMDBMoviesPage.h"

@implementation TMDBMoviesPage

+ (JSONKeyMapper *)keyMapper {
    return [JSONKeyMapper mapperForSnakeCase];
}


@end

//
//  TMDBMoviesPage.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <JSONModel/JSONModel.h>

#import "TMDBMovieEntity.h"


@interface TMDBMoviesPage : JSONModel

@property (nonatomic) NSInteger page;
@property (nonatomic) NSInteger totalPages;
@property (nonatomic) NSInteger totalResults;

@property (nonatomic) NSArray<TMDBMovieEntity> *results;

@end

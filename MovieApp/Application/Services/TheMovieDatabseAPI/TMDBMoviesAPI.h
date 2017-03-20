//
//  TMDBMoviesAPI.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TMDBMoviesPage.h"

typedef void(^TMDBMoviesAPIMoviesListCallback)(TMDBMoviesPage *moviesPage);
typedef void(^TMDBMoviesAPIMovieCallback)(TMDBMovieEntity *movie);

@interface TMDBMoviesAPI : NSObject

+ (void)fetchPopularMovies:(TMDBMoviesAPIMoviesListCallback)callback;
+ (void)fetchMovieByIdentifier:(NSUInteger)movieId response:(TMDBMoviesAPIMovieCallback)callback;

@end

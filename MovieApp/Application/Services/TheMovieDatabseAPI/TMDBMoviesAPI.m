//
//  TMDBMoviesAPI.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "TMDBMoviesAPI.h"

#import "TMDBNetworkingCore.h"

NSString * const TMDBMoviesAPIPopularMoviesListRoute = @"movie/popular";
NSString * const TMDBMoviesAPIMovieRoute = @"movie/%lu";

@implementation TMDBMoviesAPI

+ (void)fetchPopularMovies:(TMDBMoviesAPIMoviesListCallback)callback {
    
    NSAssert(callback != nil, @"You should provide callback block.");
    
    [tmdbNetworking performGET:TMDBMoviesAPIPopularMoviesListRoute
                        params:nil
                         class:[TMDBMoviesPage class]
                      response:^(NSError *error, id responseObject) {
                          callback(responseObject);
                      }];
}

+ (void)fetchMovieByIdentifier:(NSUInteger)movieId response:(TMDBMoviesAPIMovieCallback)callback {
    
    NSAssert(callback != nil, @"You should provide callback block.");
    
    NSString *route = [NSString stringWithFormat:TMDBMoviesAPIMovieRoute, (unsigned long)movieId];
    
    [tmdbNetworking performGET:route
                        params:nil
                         class:[TMDBMovieEntity class]
                      response:^(NSError *error, id responseObject) {
                          callback(responseObject);
                      }];
}

@end

//
//  PopularMoviesRouterInterface.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieInfo;


@protocol PopularMoviesRouterInterface <NSObject>

- (void)navigateToDetailsScreenWithItem:(MovieInfo *)movieInfo;

- (void)presentNoDataErrorMessage;

@end

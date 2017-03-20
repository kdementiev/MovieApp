//
//  MovieDetailsInteractor.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MovieDetailsInteractorInterface.h"


@class MovieInfo;


@interface MovieDetailsInteractor : NSObject<MovieDetailsInteractorInterface>

- (instancetype)initWithMovieInfo:(MovieInfo *)movieInfo;

@end

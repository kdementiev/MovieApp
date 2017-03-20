//
//  MovieDetailsInteractorInterface.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieInfo;

@protocol MovieDetailsInteractorDelegate <NSObject>

- (void)onMovieDetailedDataAvailable:(MovieInfo *)movie;

@end


@protocol MovieDetailsInteractorInterface <NSObject>

@property (nonatomic, weak) id<MovieDetailsInteractorDelegate> delegate;

- (void)requestDetailedContent;

@end

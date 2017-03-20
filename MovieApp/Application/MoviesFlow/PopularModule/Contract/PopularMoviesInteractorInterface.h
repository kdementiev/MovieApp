//
//  PopularMoviesInteractorInterface.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieInfo;

@protocol PopularMoviesInteractorDelegate <NSObject>

- (void)onNewContentReceived:(NSArray<MovieInfo *> *)movies;
- (void)onNetworkConnectionLost;
- (void)onNetworkConnectionRestored;

@end

@protocol PopularMoviesInteractorInterface <NSObject>

@property (nonatomic, weak) id<PopularMoviesInteractorDelegate> delegate;

- (void)requestNewContent;
- (MovieInfo *)movieForIndex:(NSUInteger)index;

@end

//
//  MovieDetailsViewInterface.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieInfo;

// Events from view
@protocol MovieDetailsViewDelegate <NSObject>
- (void)userWantsToSeeDetails;
@end

// Provides ability to controll view
@protocol MovieDetailsViewInterface <NSObject>

// Strong because we need to own output to support our structure.
@property (nonatomic, strong) id<MovieDetailsViewDelegate> delegate;

- (void)presentMovieContent:(MovieInfo *)movie;

@end

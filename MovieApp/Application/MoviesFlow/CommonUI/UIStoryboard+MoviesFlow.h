//
//  UIStoryboard+MoviesFlow.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (MoviesFlow)

+ (NSString *)popularMoviesToMovieDetailsSegueIdentifier;

- (UIViewController *)instantiateMovieDetailsViewController;

@end

//
//  UIStoryboard+MoviesFlow.m
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import "UIStoryboard+MoviesFlow.h"

@implementation UIStoryboard (MoviesFlow)

+ (NSString *)popularMoviesToMovieDetailsSegueIdentifier {
    return @"PopularMoviesToMovieDetailsSegue";
}

- (UIViewController *)instantiateMovieDetailsViewController {
    return nil; // TODO: 
}

@end

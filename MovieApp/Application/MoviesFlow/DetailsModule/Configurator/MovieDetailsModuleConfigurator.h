//
//  MovieDetailsModuleConfigurator.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>


@class UIViewController;
@class MovieInfo;

@protocol MovieDetailsViewInterface;

/*
    Create and configutate all module structure.
 */
@interface MovieDetailsModuleConfigurator : NSObject

+ (void)configurateModuleWithViewController:(UIViewController<MovieDetailsViewInterface> *)view movieInfo:(MovieInfo *)movieInfo;

@end

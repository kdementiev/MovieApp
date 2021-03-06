//
//  PopularMoviesModuleConfigurator.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIViewController;
@protocol PopularMoviesViewInterface;

/*
    Create and configutate all module structure.
 */
@interface PopularMoviesModuleConfigurator : NSObject

+ (void)configurateModuleWithViewController:(UIViewController<PopularMoviesViewInterface> *)view;

@end

//
//  PopularMoviesRouter.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PopularMoviesRouterInterface.h"

@class UIViewController;


@interface PopularMoviesRouter : NSObject<PopularMoviesRouterInterface>

- (instancetype)initWithViewController:(UIViewController *)viewController;

@end

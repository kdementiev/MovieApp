//
//  MovieDetailsRouter.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MovieDetailsRouterInterface.h"

@class UIViewController;


@interface MovieDetailsRouter : NSObject<MovieDetailsRouterInterface>

- (instancetype)initWithViewController:(UIViewController *)viewController;

@end

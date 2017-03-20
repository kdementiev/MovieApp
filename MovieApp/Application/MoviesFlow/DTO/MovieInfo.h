//
//  MovieInfo.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MovieInfo : NSObject

@property (nonatomic) NSInteger identifier;

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *originalTitle;

@property (nonatomic) NSArray<NSString*> *genres;

@property (nonatomic) NSString *overview;

@property (nonatomic) NSString *releaseDate;

@property (nonatomic) float rate;
@property (nonatomic) NSUInteger votesCount;

@property (nonatomic) NSUInteger budget;

@property (nonatomic) NSString *homepageLink;

@property (nonatomic) NSURL *posterURL;
@property (nonatomic) NSURL *backgroundURL;

@end

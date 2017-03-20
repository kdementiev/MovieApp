//
//  TMDBGenreEntity.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/18/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol TMDBGenreEntity;

@interface TMDBGenreEntity : JSONModel

@property (nonatomic) NSInteger identifier;
@property (nonatomic) NSString *name;

@end

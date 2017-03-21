//
//  NetworkingStatusService.h
//  MovieApp
//
//  Created by Konstantin Dementiev on 3/20/17.
//  Copyright © 2017 Konstantin Dementiev. All rights reserved.
//

#import <Foundation/Foundation.h>

#define networkingStatusService [NetworkingStatusService sharedInstance]

typedef void(^NetworkingStatusServiceCallback)();

@interface NetworkingStatusService : NSObject

+ (instancetype)sharedInstance;

- (void)subscribeForRefreshNetworkStat:(id)subscriber event:(NetworkingStatusServiceCallback)callback;

@end

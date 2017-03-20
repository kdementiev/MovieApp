//
//  UIViewController+Segues.h
//  smartdrive
//
//  Created by Konstantin Dementiev on 8/30/16.
//  Copyright © 2016 GeeksForLess. All rights reserved.
//

@import UIKit;

typedef void(^UIViewControllerSeguesPrepareCallback)(UIViewController* target);

/**
 *
 */
@interface UIViewController (Segues)
- (void)performSegueWithIdentifier:(NSString *)identifier prepareCallback:(UIViewControllerSeguesPrepareCallback)callback;
@end

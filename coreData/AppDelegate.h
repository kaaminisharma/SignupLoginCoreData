//
//  AppDelegate.h
//  coreData
//
//  Created by Kamini Sharma on 29/12/17.
//  Copyright © 2017 Kamini Sharma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


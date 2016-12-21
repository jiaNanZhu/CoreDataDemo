//
//  AppDelegate.h
//  CoreDataDemo2
//
//  Created by 朱佳男 on 2016/12/14.
//  Copyright © 2016年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


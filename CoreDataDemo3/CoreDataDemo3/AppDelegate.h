//
//  AppDelegate.h
//  CoreDataDemo3
//
//  Created by 朱佳男 on 2016/12/19.
//  Copyright © 2016年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


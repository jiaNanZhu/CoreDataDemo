//
//  PersonManager.h
//  CoreDataDemo3
//
//  Created by 朱佳男 on 2016/12/19.
//  Copyright © 2016年 ShangYuKeJi. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@interface PersonManager : NSObject
+(PersonManager *)sharePersonManager;
-(void)insertPersonWithDictionary:(NSDictionary *)dic;
-(BOOL)isExistWithID:(NSString *)uid;
-(void)updatePersonWithDictionary:(NSDictionary *)dic;
-(NSArray *)selectPersonFromLocalWithName:(NSString *)string;
@end

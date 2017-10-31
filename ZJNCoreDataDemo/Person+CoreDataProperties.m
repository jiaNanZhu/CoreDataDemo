//
//  Person+CoreDataProperties.m
//  ZJNCoreDataDemo
//
//  Created by 朱佳男 on 2017/10/31.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic name;
@dynamic age;
@dynamic sex;
@dynamic phone;
@dynamic cards;

@end

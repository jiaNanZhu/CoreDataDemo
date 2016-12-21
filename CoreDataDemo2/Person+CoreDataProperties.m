//
//  Person+CoreDataProperties.m
//  CoreDataDemo2
//
//  Created by 朱佳男 on 2016/12/14.
//  Copyright © 2016年 ShangYuKeJi. All rights reserved.
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic name;
@dynamic age;

@end

//
//  Person+CoreDataProperties.h
//  CoreDataDemo2
//
//  Created by 朱佳男 on 2016/12/14.
//  Copyright © 2016年 ShangYuKeJi. All rights reserved.
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;

@end

NS_ASSUME_NONNULL_END

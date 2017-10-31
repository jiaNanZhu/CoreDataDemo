//
//  Person+CoreDataProperties.h
//  ZJNCoreDataDemo
//
//  Created by 朱佳男 on 2017/10/31.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;
@property (nonatomic) BOOL sex;
@property (nullable, nonatomic, copy) NSString *phone;
@property (nullable, nonatomic, retain) NSSet<Card *> *cards;

@end

@interface Person (CoreDataGeneratedAccessors)

- (void)addCardsObject:(Card *)value;
- (void)removeCardsObject:(Card *)value;
- (void)addCards:(NSSet<Card *> *)values;
- (void)removeCards:(NSSet<Card *> *)values;

@end

NS_ASSUME_NONNULL_END

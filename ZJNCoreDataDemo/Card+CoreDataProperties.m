//
//  Card+CoreDataProperties.m
//  ZJNCoreDataDemo
//
//  Created by 朱佳男 on 2017/10/31.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//
//

#import "Card+CoreDataProperties.h"

@implementation Card (CoreDataProperties)

+ (NSFetchRequest<Card *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Card"];
}

@dynamic cardNumber;
@dynamic owner;

@end

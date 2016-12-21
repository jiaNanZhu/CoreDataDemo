//
//  PersonManager.m
//  CoreDataDemo3
//
//  Created by 朱佳男 on 2016/12/19.
//  Copyright © 2016年 ShangYuKeJi. All rights reserved.
//

#import "PersonManager.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Person+CoreDataClass.h"
@interface PersonManager()
{
    AppDelegate *app;
}
@end
@implementation PersonManager
+(PersonManager *)sharePersonManager{
    static PersonManager *manager = nil;
    @synchronized (self) {
        if (manager == nil) {
            manager = [[self alloc]init];
        }
        return manager;
    }
}
-(id)init{
    self = [super init];
    if (self) {
        app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    }
    return self;
}
-(void)insertPersonWithDictionary:(NSDictionary *)dic{
    BOOL isExist = [self isExistWithID:dic[@"uid"]];
    if (isExist) {
        [self updatePersonWithDictionary:dic];
    }else
    {
        Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
        person.uid = [NSString stringWithFormat:@"%@",dic[@"uid"]];
        person.supplierId = [NSString stringWithFormat:@"%@",dic[@"supplierId"]];
        person.userName = [NSString stringWithFormat:@"%@",dic[@"userName"]];
        person.realName = [NSString stringWithFormat:@"%@",dic[@"realName"]];
        person.deptId = [NSString stringWithFormat:@"%@",dic[@"deptId"]];
        person.gender = [NSString stringWithFormat:@"%@",dic[@"gender"]];
        person.birthday = [NSString stringWithFormat:@"%@",dic[@"birthday"]];
        person.portrait = [NSString stringWithFormat:@"%@",dic[@"portrait"]];
        person.tel = [NSString stringWithFormat:@"%@",dic[@"tel"]];
        person.phone = [NSString stringWithFormat:@"%@",dic[@"phone"]];
        person.qq = [NSString stringWithFormat:@"%@",dic[@"qq"]];
        person.email = [NSString stringWithFormat:@"%@",dic[@"email"]];
        person.lastLogin = [NSString stringWithFormat:@"%@",dic[@"lastLogin"]];
        person.lastDevice = [NSString stringWithFormat:@"%@",dic[@"lastDevice"]];
        person.lastIp = [NSString stringWithFormat:@"%@",dic[@"lastIp"]];
        person.loginNum = [NSString stringWithFormat:@"%@",dic[@"loginNum"]];
        person.status = [NSString stringWithFormat:@"%@",dic[@"status"]];
        person.attr1 = [NSString stringWithFormat:@"%@",dic[@"attr1"]];
        person.attr2 = [NSString stringWithFormat:@"%@",dic[@"attr2"]];
        person.attr3 = [NSString stringWithFormat:@"%@",dic[@"attr3"]];
        person.attr4 = [NSString stringWithFormat:@"%@",dic[@"attr4"]];
        person.attr5 = [NSString stringWithFormat:@"%@",dic[@"attr5"]];
        person.createTime = [NSString stringWithFormat:@"%@",dic[@"createTime"]];
        person.updateTime = [NSString stringWithFormat:@"%@",dic[@"updateTime"]];
        person.deptName = [NSString stringWithFormat:@"%@",dic[@"deptName"]];
        person.imgpath = [NSString stringWithFormat:@"%@",dic[@"imgpath"]];
        person.userPosition = [NSString stringWithFormat:@"%@",dic[@"userPosition"]];
        [app.persistentContainer.viewContext save:nil];
    }
}
-(BOOL)isExistWithID:(NSString *)uid
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"uid = %@",uid];
    request.predicate = predicate;
    NSArray *array = [app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    if (array.count >0) {
        return YES;

    }else
    {
        return NO;
    }
}
-(void)updatePersonWithDictionary:(NSDictionary *)dic
{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"uid = %@",dic[@"uid"]];
    request.predicate = predicate;
    NSArray *array = [app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    if (array.count) {
        for (Person *person in array) {
            person.uid = [NSString stringWithFormat:@"%@",dic[@"uid"]];
            person.supplierId = [NSString stringWithFormat:@"%@",dic[@"supplierId"]];
            person.userName = [NSString stringWithFormat:@"%@",dic[@"userName"]];
            person.realName = [NSString stringWithFormat:@"%@",dic[@"realName"]];
            person.deptId = [NSString stringWithFormat:@"%@",dic[@"deptId"]];
            person.gender = [NSString stringWithFormat:@"%@",dic[@"gender"]];
            person.birthday = [NSString stringWithFormat:@"%@",dic[@"birthday"]];
            person.portrait = [NSString stringWithFormat:@"%@",dic[@"portrait"]];
            person.tel = [NSString stringWithFormat:@"%@",dic[@"tel"]];
            person.phone = [NSString stringWithFormat:@"%@",dic[@"phone"]];
            person.qq = [NSString stringWithFormat:@"%@",dic[@"qq"]];
            person.email = [NSString stringWithFormat:@"%@",dic[@"email"]];
            person.lastLogin = [NSString stringWithFormat:@"%@",dic[@"lastLogin"]];
            person.lastDevice = [NSString stringWithFormat:@"%@",dic[@"lastDevice"]];
            person.lastIp = [NSString stringWithFormat:@"%@",dic[@"lastIp"]];
            person.loginNum = [NSString stringWithFormat:@"%@",dic[@"loginNum"]];
            person.status = [NSString stringWithFormat:@"%@",dic[@"status"]];
            person.attr1 = [NSString stringWithFormat:@"%@",dic[@"attr1"]];
            person.attr2 = [NSString stringWithFormat:@"%@",dic[@"attr2"]];
            person.attr3 = [NSString stringWithFormat:@"%@",dic[@"attr3"]];
            person.attr4 = [NSString stringWithFormat:@"%@",dic[@"attr4"]];
            person.attr5 = [NSString stringWithFormat:@"%@",dic[@"attr5"]];
            person.createTime = [NSString stringWithFormat:@"%@",dic[@"createTime"]];
            person.updateTime = [NSString stringWithFormat:@"%@",dic[@"updateTime"]];
            person.deptName = [NSString stringWithFormat:@"%@",dic[@"deptName"]];
            person.imgpath = [NSString stringWithFormat:@"%@",dic[@"imgpath"]];
            person.userPosition = [NSString stringWithFormat:@"%@",dic[@"userPosition"]];
            [app.persistentContainer.viewContext save:nil];
        }
    }
}
-(NSArray *)selectPersonFromLocalWithName:(NSString *)string{
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    request.entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:app.persistentContainer.viewContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"realName=%@",string];
    request.predicate = predicate;
    NSArray *array = [app.persistentContainer.viewContext executeFetchRequest:request error:nil];
    return array;
}
@end

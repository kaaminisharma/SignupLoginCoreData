//
//  UserDetails+CoreDataProperties.m
//  coreData
//
//  Created by Kamini Sharma on 03/01/18.
//  Copyright © 2018 Kamini Sharma. All rights reserved.
//
//

#import "UserDetails+CoreDataProperties.h"

@implementation UserDetails (CoreDataProperties)

+ (NSFetchRequest<UserDetails *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserDetails"];
}

@dynamic password;
@dynamic email;
@dynamic username;

@end

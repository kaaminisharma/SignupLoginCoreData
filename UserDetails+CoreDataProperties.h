//
//  UserDetails+CoreDataProperties.h
//  coreData
//
//  Created by Kamini Sharma on 03/01/18.
//  Copyright © 2018 Kamini Sharma. All rights reserved.
//
//

#import "UserDetails+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserDetails (CoreDataProperties)

+ (NSFetchRequest<UserDetails *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *username;

@end

NS_ASSUME_NONNULL_END

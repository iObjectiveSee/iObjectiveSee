//
//  NSManagedObject+iOS.m
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import "NSManagedObject+iOS.h"

@implementation NSManagedObject (iOS)

+ (NSManagedObjectContext *)managedObjectContext {
	return [[UIApplication sharedApplication].delegate performSelector:@selector(managedObjectContext)];
}

+ (NSString *)className {
    return NSStringFromClass([self class]);
}

- (NSString *)className {
    return NSStringFromClass([self class]);
}

+ (id)createAndInsert {
    return [NSEntityDescription insertNewObjectForEntityForName:[self className] inManagedObjectContext: self.managedObjectContext];
}

+ (NSManagedObjectContext *)dettachedContext {
    return [[UIApplication sharedApplication].delegate performSelector:@selector(managedObjectContextTransient)];
}

+ (id)createDettached {
    return [NSEntityDescription insertNewObjectForEntityForName:[self className] inManagedObjectContext:[self dettachedContext]];
}

+ (NSUInteger)countForProperty:(NSString *)property withPredicate:(NSPredicate *)pred {
    NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:[NSEntityDescription entityForName:[self className] inManagedObjectContext: self.managedObjectContext]];
	[req setPredicate:pred];
	NSError *error = nil;
	//NSArray *results = [self.managedObjectContext executeFetchRequest:req error:&error];
    NSUInteger resultCount = [self.managedObjectContext countForFetchRequest: req error: &error];
	if (error) {
		NSLog(@"error %@ fetching request %@", error, req);
		return 0;
	}
	return resultCount;
}

+ (NSUInteger)countForProperty:(NSString *)property withValueGreaterOrEqualTo:(id)value {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K >= %@", property, value];
    return [[self class] countForProperty:property withPredicate:pred];
}

+ (NSUInteger)countForProperty:(NSString *)property withValue:(id)value {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K = %@", property, value];
    return [[self class] countForProperty:property withPredicate:pred];
}

+ (NSArray *)findAllByProperty:(NSString *)property withValue:(id)value moc:(NSManagedObjectContext *)moc {
    if (!moc) {
        return nil;
    }
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K = %@", property, value];
	NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:[NSEntityDescription entityForName:[self className] inManagedObjectContext: moc]];
	[req setPredicate:pred];
	NSError *error = nil;
	NSArray *results = [moc executeFetchRequest:req error:&error];
	if (error) {
		NSLog(@"error %@ fetching request %@", error, req);
		return nil;
	}
	if ([results count]<1){
		return nil;
	}
	return results;
}

+ (NSArray *)findAllByPropertyWithValueNotNil:(NSString *)property {
    return [self findAllByPropertyWithValueNotNil:property moc:self.managedObjectContext];
}

+ (NSArray *)findAllByPropertyWithValueNotNil:(NSString *)property moc:(NSManagedObjectContext *)moc {
    if (!moc) {
        return nil;
    }
	NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K != nil", property];
	NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:[NSEntityDescription entityForName:[self className] inManagedObjectContext:moc]];
	[req setPredicate:pred];
	NSError *error = nil;
	NSArray *results = [moc executeFetchRequest:req error:&error];
	if (error) {
		NSLog(@"error %@ fetching request %@", error, req);
		return nil;
	}
	if ([results count]<1){
		return nil;
	}
	return results;
}

+ (NSArray *)findAllByProperty:(NSString *)property withValue:(id)value {
    return [self findAllByProperty:property withValue:value moc:self.managedObjectContext];
}

+ (id)findByProperty:(NSString *)property withValue:(id)value moc:(NSManagedObjectContext *)moc {
    NSArray *results = [self findAllByProperty: property withValue: value moc:moc];
	return [results lastObject];
}

+ (id)findByProperty:(NSString *)property withValue:(id)value {
	return [self findByProperty:property withValue:value moc:self.managedObjectContext];
}

+ (NSArray *)listAllMoc:(NSManagedObjectContext *)moc {
	NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:[NSEntityDescription entityForName:[self className] inManagedObjectContext:moc]];
	NSError *error = nil;
	NSArray *results = [moc executeFetchRequest:req error:&error];
	if (error) {
		NSLog(@"error %@ fetching request %@", error, req);
		return nil;
	}
    return results;
}

+ (NSArray *)listAll {
    return [self listAllMoc:self.managedObjectContext];
}

+ (int)countAllMoc:(NSManagedObjectContext *)moc {
	NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:[NSEntityDescription entityForName:[self className] inManagedObjectContext:moc]];
	NSError *error = nil;
	int ret = [moc countForFetchRequest:req error:&error];
	if (error) {
		NSLog(@"error %@ fetching request %@", error, req);
		return 0;
	}
    return ret;
}

+ (int)countAll {
    return [self countAllMoc:self.managedObjectContext];
}

+ (NSArray *)findAllByProperty:(NSString *)property inValues:(NSArray *)values moc:(NSManagedObjectContext *)moc {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K in %@", property, values];
	NSFetchRequest *req = [[NSFetchRequest alloc] init];
	[req setEntity:[NSEntityDescription entityForName:[self className] inManagedObjectContext:moc]];
    [req setPredicate:pred];
	NSError *error = nil;
	NSArray *results = [moc executeFetchRequest:req error:&error];
	if (error) {
		NSLog(@"error %@ fetching request %@", error, req);
		return nil;
	}
    return results;
}

+ (NSArray *)findAllByProperty:(NSString *)property inValues:(NSArray *)values {
    return [self findAllByProperty:property inValues:values moc:self.managedObjectContext];
}

+ (void)deleteAll {
    NSArray *all = [self listAll];
    for (NSManagedObject *obj in all) {
        [self.managedObjectContext deleteObject:obj];
    }
}

- (BOOL)save {
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        return NO;
    }
    return YES;
}

- (BOOL)deleteAndSave {
    [self.managedObjectContext deleteObject:self];
    return [self save];
}

- (BOOL)hasChangesOld {
    return self.isInserted || self.isDeleted || self.isUpdated;
}

@end

//
//  NSManagedObject+iOS.h
//  iObjectiveSee
//
//  Created by Sarah Lensing on 12/22/12.
//
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (iOS)

+ (NSManagedObjectContext *)managedObjectContext;
+ (NSManagedObjectContext *)dettachedContext;
+ (NSString *)className;
- (NSString *)className;
+ (NSInteger)countAll;
+ (NSUInteger)countForProperty:(NSString *)property withValueGreaterOrEqualTo:(id)value;
+ (NSUInteger)countForProperty:(NSString *)property withValue:(id)value;
+ (NSArray *)findAllByPropertyWithValueNotNil:(NSString *)property;
+ (NSArray *)findAllByProperty:(NSString *)property withValue:(id)value;
+ (NSArray *)findAllByProperty:(NSString *)property withValue:(id)value moc:(NSManagedObjectContext *)moc;
+ (id)findByProperty:(NSString *)property withValue:(id)value;
+ (id)findByProperty:(NSString *)property withValue:(id)value moc:(NSManagedObjectContext *)moc;
+ (NSArray *)listAll;
+ (NSArray *)listAllMoc:(NSManagedObjectContext *)moc;
+ (NSArray *)findAllByProperty:(NSString *)property inValues:(NSArray *)ids;
+ (NSArray *)findAllByProperty:(NSString *)property inValues:(NSArray *)values moc:(NSManagedObjectContext *)moc;
+ (id)createAndInsert;
+ (id)createDettached;
+ (void)deleteAll;
- (BOOL)deleteAndSave;
- (BOOL)save;
- (BOOL)hasChangesOld;
- (void)revertChanges;

@end

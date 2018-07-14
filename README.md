# iOS Assignment 2

The performance bottleneck is formatting the salary on scroll time. 
Instead of calling it at scroll time, creating a String property like salaryString and calling the formatting method in the init method can upgrade the performance of scrolling.

-------

# iOS Assignment 1

## p 1. Set a return type like "void"
## p 2. Not need to import Person. Actually there is no Person.h file
## p 3. You may want to import Person as a CoreDataClass #import "Person+CoreDataClass.h"
##  p 4. import CoreData framework to use NSManagedObjects
##  p 5. static block is ok but why? Block Itself is a pointer and thread-safe
## p 6. double is not a problem but in most float is enough for progressbars
## p 7. NSManagedObjects themselves are not thread-safe. If you save in the background, you need to merge your changes to other contexts using one of the Core Data system notifications, NSManagedObjectContextDidSaveNotification.
## p 8. Do not call UI func in the bacground thread. You cannot know when it will load. Even you cannot know if it will load or not. Maybe update method has a meain thread call, It is ok then.
## p 9. UI func in bg therad again. If update method not in main thread, Second call of this ui function covers the effect of the first call
## p10. Block returns in background thread. It is ok but pay attention for it.

## File T1.h

#import <Foundation/Foundation.h>

typedef void (^TestClassCallback)(); // p 1. Set a return type like "void"

// Person is a subclass of NSManagedObject

@class Person;

@interface T1 : NSObject

- (void)doWorkWithPerson:(Person*)aPerson callback:(TestClassCallback)aCallback;

@end

## File T1.m


#import "T1.h"

#import "Person.h" // p 2. Not need to import Person. Actually there is no Person.h file

// p 3. You may want to import Person as a CoreDataClass #import "Person+CoreDataClass.h"

// p 4. import CoreData framework to use NSManagedObjects

#import "ProgressBar.h"

@implementation T1

static TestClassCallback savedCallback; // p 5. static block is ok but why? Block Itself is a pointer and thread-safe

- (void)doWorkWithPerson:(Person*)aPerson callback:(TestClassCallback)aCallback

{

savedCallback = aCallback;

[self performSelectorInBackground:@selector(doVeryLongTask1:) withObject:aPerson];

}

- (void)doVeryLongTask1:(Person*)aPerson

{

double p = 0.0; // p 6. not a problem but in most float is enough for progressbars



// p 7. NSManagedObjects themselves are not thread-safe. If you save in the background, you need to merge your changes to other contexts using one of the Core Data system notifications, NSManagedObjectContextDidSaveNotification.



// Do some actions.

// ...

// ...

[[ProgressBar instance] update:p]; // p 8. Do not call UI func in the bacground thread. You cannot know when it will load. Even you cannot know if it will load or not. Maybe update method has a meain thread call, It is ok then.

// Do more actions.

// ...

// ...

[[ProgressBar instance] update:p]; // p 9. UI func in bg therad again. If update method not in main thread, Second call of this ui function covers the effect of the first call

// Do final actions.

(savedCallback)(); // p10. Block returns in background thread. It is ok but pay attention for it.

}

@end


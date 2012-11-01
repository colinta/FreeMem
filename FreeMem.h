#import <Foundation/Foundation.h>
#import <mach/mach.h>
#import <mach/mach_host.h>


natural_t get_free_memory();


@interface FreeMem : NSObject

+ (natural_t) freeMemory;

@end

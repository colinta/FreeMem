#import "FreeMem.h"


vm_size_t get_used_memory(void) {
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    return (kerr == KERN_SUCCESS) ? info.resident_size : 0;
}


natural_t get_free_memory()
{
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t pagesize;
    vm_statistics_data_t vm_stat;
    host_page_size(host_port, &pagesize);

    if ( host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS )
    {
        NSLog(@"Failed to fetch vm statistics");
        return 0;
    }

    /* Stats in bytes */
    return vm_stat.free_count * pagesize;
}


@implementation FreeMem : NSObject

+ (natural_t) freeMemory
{
    return get_free_memory() / 1000.0f;
}

+ (natural_t) usedMemory
{
    return get_used_memory() / 1000.0f;
}

@end

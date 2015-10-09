# dispatch-lite

a dispatcher like gcd for c++

Usage:

 pod 'DispatchLite', '~> 0.0.1'

	/* init dispatch first */
	dispatch_init();
	
	/* dispatch on preallocate logic thread */
    dispatch_logic_async([=]{
        //your code here
    });
    
    /* dispatch on specific thread */
    dispatch_thread_async(thread, [=]{
        //your code here
    });
	
	/* dispatch on current thread after 500ms */
    dispatch_current_after(500, [=]{
        //your code here
    });

Limits:

1: thread pool is not supported yet

2: messageloop for UI is not supported yet
	
ToDo:

1: thread pool for dispatch_async()
use dispatch_get_global() to get a thread which is idle

2: support messageloop for UI 

module pthread;

extern(C) {
	alias void*	pthread_t;
	alias void* pthread_attr_t;
	alias void* pthread_cond_t;
    alias void* pthread_condattr_t;
    alias void* pthread_key_t;
    alias void* pthread_mutex_t;
    alias void* pthread_mutexattr_t;
    alias void* pthread_once_t;
    alias void* pthread_rwlock_t;
    alias void* pthread_rwlockattr_t;
    alias int clockid_t;
    alias long off_t;
    alias off_t off64_t;
    alias c_long = long;
    alias uint sigset_t;
    alias c_long time_t;
    alias Callback = int function (void*, size_t, void*);
    alias ulong Unwind_ptr;

    char end;

    int __errno_location() {
    	return 0;
    }

	struct sched_param {}
	struct timespec {
		time_t  tv_sec;
        c_long  tv_nsec;
	}
	struct tls_index {}
	struct sem_t {}

	int pthread_create(pthread_t* pth, in pthread_attr_t*, void* function(void*), void*) {
		return 0;
	}

	int pthread_atfork(void function(), void function(), void function()){
		return 0;
	}

	int pthread_attr_destroy(pthread_attr_t*) {
		return 0;
	}

	int pthread_attr_getdetachstate(in pthread_attr_t*, int*) {
		return 0;
	}

	int pthread_attr_getschedparam(in pthread_attr_t*, sched_param*) {
		return 0;
	}

	int pthread_attr_init(pthread_attr_t*) {
		return 0;
	}

	int pthread_attr_setstacksize(pthread_attr_t*, size_t) {
		return 0;
	}

	int pthread_attr_setdetachstate(pthread_attr_t*, int) {
		return 0;
	}

	int pthread_attr_setschedparam(in pthread_attr_t*, sched_param*) {
		return 0;
	}

	int pthread_cancel(pthread_t) {
		return 0;
	}

	void pthread_cleanup_push(void function(void*), void*) {}

	void pthread_cleanup_pop(int) {}

	int pthread_cond_broadcast(pthread_cond_t*) {
		return 0;
	}

	int pthread_cond_destroy(pthread_cond_t*) {
		return 0;
	}

	int pthread_cond_init(in pthread_cond_t*, pthread_condattr_t*) {
		return 0;
	}

	int pthread_cond_signal(pthread_cond_t*) {
		return 0;
	}

	int pthread_cond_timedwait(pthread_cond_t*, pthread_mutex_t*, in timespec*) {
		return 0;
	}

	int pthread_cond_wait(pthread_cond_t*, pthread_mutex_t*) {
		return 0;
	}

	int pthread_condattr_destroy(pthread_condattr_t*) {
		return 0;
	}

	int pthread_condattr_getclock(in pthread_condattr_t*, clockid_t*) {
		return 0;
	}

  	int pthread_condattr_setclock(pthread_condattr_t*, clockid_t) {
  		return 0;
  	}

	int pthread_condattr_init(pthread_condattr_t*) {
		return 0;
	}

	int pthread_create(pthread_t*, in pthread_attr_t*, void* function(void*), void*) {
		return 0;
	}

	int pthread_detach(pthread_t) {
		return 0;
	}

	int pthread_equal(pthread_t, pthread_t) {
		return 0;
	}

	void pthread_exit(void*) {}

	void* pthread_getspecific(pthread_key_t) {
		return null;
	}

	int pthread_join(pthread_t, void**) {
		return 0;
	}

	int pthread_kill(pthread_t, int) {
		return 0;
	}

	int pthread_sigmask(int, in sigset_t*, sigset_t*) {
		return 0;
	}

	int pthread_key_create(pthread_key_t*, void function(void*)) {
		return 0;
	}

	int pthread_key_delete(pthread_key_t) {
		return 0;
	}

	int pthread_mutex_destroy(pthread_mutex_t*) {
		return 0;
	}

	int pthread_mutex_init(pthread_mutex_t*, pthread_mutexattr_t*) {
		return 0;
	}

	int pthread_mutex_lock(pthread_mutex_t*) {
		return 0;
	}

	int pthread_mutex_trylock(pthread_mutex_t*) {
		return 0;
	}

	int pthread_mutex_unlock(pthread_mutex_t*) {
		return 0;
	}

	int pthread_mutexattr_destroy(pthread_mutexattr_t*) {
		return 0;
	}

	int pthread_mutexattr_init(pthread_mutexattr_t*) {
		return 0;
	}

	int pthread_mutexattr_settype(pthread_mutexattr_t*, int) {
		return 0;
	}

	int pthread_once(pthread_once_t*, void function()) {
		return 0;
	}

	int pthread_rwlock_destroy(pthread_rwlock_t*) {
		return 0;
	}

	int pthread_rwlock_init(pthread_rwlock_t*, in pthread_rwlockattr_t*) {
		return 0;
	}

	int pthread_rwlock_rdlock(pthread_rwlock_t*) {
		return 0;
	}

	int pthread_rwlock_tryrdlock(pthread_rwlock_t*) {
		return 0;
	}

	int pthread_rwlock_trywrlock(pthread_rwlock_t*) {
		return 0;
	}

	int pthread_rwlock_unlock(pthread_rwlock_t*) {
		return 0;
	}

	int pthread_rwlock_wrlock(pthread_rwlock_t*) {
		return 0;
	}

	int pthread_rwlockattr_destroy(pthread_rwlockattr_t*) {
		return 0;
	}

	int pthread_rwlockattr_init(pthread_rwlockattr_t*) {
		return 0;
	}

	pthread_t pthread_self() {
		return cast (pthread_t) 0;
	}

	int pthread_setcancelstate(int, int*) {
		return 0;
	}

	int pthread_setcanceltype(int, int*) {
		return 0;
	}

	int pthread_setspecific(pthread_key_t, in void*) {
		return 0;
	}

	int pthread_attr_getguardsize(in pthread_attr_t*, size_t*) {
		return 0;
	}
	
	int pthread_attr_setguardsize(pthread_attr_t*, size_t) {
		return 0;
	}
	
	int pthread_getconcurrency() {
		return 0;
	}
	
	int pthread_mutexattr_gettype(in pthread_mutexattr_t*, int*) {
		return 0;
	}
	
	int pthread_mutexattr_settype(pthread_mutexattr_t*, int) {
		return 0;
	}
	
	int pthread_setconcurrency(int) {
		return 0;
	}
	
	void* __tls_get_addr(tls_index* ti) {
		return null;
	}

	int backtrace(void** buffer, int size) {
		return 0;
	}

	char** backtrace_symbols(const(void*)* buffer, int size) {
		return null;
	}

	void backtrace_symbols_fd(const(void*)* buffer, int size, int fd) {}

	int clock_gettime(clockid_t, timespec*) {
		return 0;
	}

	int munmap(void *, size_t) {
		return 0;
	}

	int ftruncate64(int, off_t) {
		return 0;
	}

	int lockf64(int, int, off_t) {
		return 0;
	}

	int open64(in char*, int, ...) {
		return 0;
	}

	c_long sysconf(int) {
		return 0;
	}

	void* mmap64(void*, size_t, int, int, int, off64_t) {
		return null;
	}

	int sigfillset(sigset_t*) {
		return 0;
	}

	int sem_wait(sem_t*) {
		return 0;
	}

	int sched_yield() {
		return 0;
	}

	int clock_getres(clockid_t, timespec*) {
		return 0;
	}

	int nanosleep(in timespec*, timespec* dur) {
		return 0;
	}

	int dl_iterate_phdr(Callback callback, void* data)
	{
		assert(0);
	}

	Unwind_ptr _d_eh_GetIPInfo() {
		assert (0);
	}

	int _gettimeofday() {
		return 0;
	}
}
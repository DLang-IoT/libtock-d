module unit_test;

extern(C) {
    struct unit_test_fun;
    
    void set_failure_reason(const char* reason);
    void unit_test_runner(unit_test_fun* tests, uint test_count, uint timeout_ms, const char* svc_name);
    void unit_test_service();
}
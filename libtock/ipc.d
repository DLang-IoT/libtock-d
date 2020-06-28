module ipc;

import tock;

extern(C) {
    int ipc_discover(const char* pkg_name);

    int ipc_register_svc(subscribe_cb callback, void* ud);
    int ipc_register_client_cb(int svc_id, subscribe_cb callback, void* ud);

    int ipc_notify_client(int pid);

    int ipc_notify_svc(int pid);

    int ipc_share(int pid, void* base, int len);
}
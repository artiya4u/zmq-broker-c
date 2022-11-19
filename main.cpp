#include <czmq.h>

int main() {
    void *context = zmq_ctx_new();
    void *frontend = zmq_socket(context, ZMQ_XSUB);
    assert(frontend);
    void *backend = zmq_socket(context, ZMQ_XPUB);
    assert(backend);
//  Bind both sockets to TCP ports
    assert(zmq_bind(frontend, getenv("ZMQ_FRONT_ADDRESS")) == 0);
    assert(zmq_bind(backend, getenv("ZMQ_BACK_ADDRESS")) == 0);
//  Start the queue proxy, which runs until ETERM
    zmq_proxy(frontend, backend, NULL);
    return 0;
}
FROM gcc

RUN apt-get update && apt-get install -y cmake libczmq-dev

# CREART CMAKE BUILD
RUN cmake -S . -B ./cmake-build

# BUILD
RUN cmake --build ./cmake-build --target zmq_broker_c -- -j 6

# Run
CMD [ "/cmake-build/zmq-broker-c" ]
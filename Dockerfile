FROM gcc

RUN apt-get update && apt-get install -y cmake libczmq-dev

# COPY
COPY . .

# CREART CMAKE BUILD
RUN cmake -S . -B ./cmake-build

# BUILD
RUN cmake --build ./cmake-build --target zmq_broker_c --

# Run
CMD [ "/cmake-build/zmq_broker_c" ]
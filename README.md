# zmq-broker-c

## Description

Service built in C under "Pub-Sub Network with a Proxy" ZeroMQ pattern. See
ZeroMQ [documentation](https://zguide.zeromq.org/docs/chapter2/) on pattern.

## Installation

- MacOS

```shell
# Install C compiler on MacOS
xcode-select --install

# Install cmake
brew install cmake

# Install ZeroMQ lib
brew install czmq
brew install cppzmq
```

- Linux (Debian like)

```shell
sudo apt-get update && sudo apt-get install -y build-essential cmake libczmq-dev
```

## Environmental Variables

```
# Front port of the broker where publishers send into the broker
ZMQ_FRONT_ADDRESS=tcp://*:5555

# Back port of the broker where subscribers listen from the broker
ZMQ_BACK_ADDRESS=tcp://*:5556
```

## RUN

### Development

```
cmake -S . -B ./cmake-build-debug
cmake --build ./cmake-build-debug --target zmq_broker_c --
./cmake-build-debug/zmq_broker_c
```

### Build Docker image.

```shell
# Build
docker build . -t zmq-broker-c:latest
# Run
docker run -d -it --net=host -e ZMQ_FRONT_ADDRESS=tcp://*:5555 -e ZMQ_BACK_ADDRESS=tcp://*:5556 zmq-broker-c:latest
```

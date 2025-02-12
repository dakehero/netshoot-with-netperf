# netshoot-netperf Docker Image

A lightweight Docker image based on [nicolaka/netshoot](https://github.com/nicolaka/netshoot) with statically compiled netperf for advanced network performance testing in containerized environments.

## Features
- Prebuilt Static Netperf: Includes netperf 2.7.0 compiled with static linking for dependency-free execution.   
- Extended Network Toolkit: Inherits all tools from netshoot (e.g., tcpdump, iperf3, curl) and adds netperf for TCP/UDP throughput and latency benchmarking.   
- Minimal Overhead: Alpine Linux base ensures a compact image size (~50MB).

## Build the Image
Clone the repository and build:

``` bash
git clone https://github.com/dakehero/netshoot-with-netperf.git
cd netshoot-netperf  
docker build -t netshoot-netperf .  
```

## Acknowledgments
Special thanks to the [nicolaka/netshoot](https://github.com/nicolaka/netshoot) project for providing the foundational network troubleshooting toolkit.

For detailed documentation, refer to the original netshoot documentation.


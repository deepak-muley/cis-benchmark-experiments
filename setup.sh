#!/bin/bash

brew install kube-bench
kind create cluster --name kube-bench-test
kube-bench version
# download the config files
curl -o kube-bench_0.14.1_darwin_arm64.tar.gz https://github.com/aquasecurity/kube-bench/releases/download/v0.14.1/kube-bench_0.14.1_darwin_arm64.tar.gz
tar -xzf kube-bench_0.14.1_darwin_arm64.tar.gz
mv kube-bench_0.14.1_darwin_arm64/kube-bench /usr/local/bin/kube-bench

kube-bench run --config-dir kube-bench_0.14.1_darwin_arm64/cfg > report.txt
cat report.txt
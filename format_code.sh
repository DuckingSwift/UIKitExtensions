#!/bin/bash

set -euo pipefail

echo "Building swiftformat..."
swift build --product swiftformat -c release

echo "Formatting..."
.build/release/swiftformat .

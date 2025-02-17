#!/bin/bash

set -euo pipefail

cargo build --quiet --profile release
file target/release/mycrate | grep -o 'debug_info' || echo 'No debug info'
cargo build --quiet --release
file target/release/mycrate | grep -o 'debug_info' || echo 'No debug info'

cargo lambda build --quiet --profile release
file target/lambda/mycrate/bootstrap | grep -o 'debug_info' || echo 'No debug info'
cargo lambda build --quiet --release
file target/lambda/mycrate/bootstrap | grep -o 'debug_info' || echo 'No debug info'


cd mycrate

cargo build --quiet --profile release
file ../target/release/mycrate | grep -o 'debug_info' || echo 'No debug info'
cargo build --quiet --release
file ../target/release/mycrate | grep -o 'debug_info' || echo 'No debug info'

cargo lambda build --quiet --profile release
file ../target/lambda/mycrate/bootstrap | grep -o 'debug_info' || echo 'No debug info'
cargo lambda build --quiet --release # This is the problematic one
file ../target/lambda/mycrate/bootstrap | grep -o 'debug_info' || echo 'No debug info'




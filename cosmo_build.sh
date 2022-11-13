#!/bin/bash
FDIR=libcosmo
if [ -d "$FDIR" ]; then
    echo "$FDIR exists, no need to get it"
else 
    echo "creating and extract cosmopolitan libc into $FDIR.."
    mkdir libcosmo
    cd libcosmo
    wget https://justine.lol/cosmopolitan/cosmopolitan.zip
    unzip cosmopolitan.zip
    ls -al
    cd ../
fi

cargo +nightly build --release -Zbuild-std=panic_abort,std -Zbuild-std-features="" --target=./x86_64-unknown-linux-cosmo.json && objcopy -SO binary ./target/x86_64-unknown-linux-cosmo/release/netcat.com.dbg ./target/x86_64-unknown-linux-cosmo/release/netcat.com

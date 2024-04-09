#!/bin/bash

create_directory() {
    if [ -d "demo" ]; then
        echo "Directory already exists"
        return 1
    else
        mkdir demo
        echo "Directory created"
    fi
}

if ! create_directory; then
    echo "The code is being exited as the directory already exists"
    exit 1
fi

echo "This line should not be executed if the directory already exists"


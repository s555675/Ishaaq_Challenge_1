#!/bin/bash

if ! docker-compose exec nginx curl -sk https://localhost | grep -q "Hello World"; then
    echo "Test failed: 'index page' not found."
    exit 1
else
    echo "Test passed"
fi

if ! curl -I http://localhost 2>/dev/null | grep -q "301 Moved Permanently"; then
    echo "Test failed: HTTP requests are not getting redirected"
    exit 1
else
    echo "Test passed"
fi

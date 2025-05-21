#!/bin/bash
git config --global --add safe.directory /workspace

make composer-install
make sf-start-notls
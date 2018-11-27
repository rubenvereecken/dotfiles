#!/bin/bash
cd ~/.i3
make clean config
i3-msg "reload"

#!/bin/bash

if [ ! -f /root/.already_ran ]; then
	echo "Welcome to the AI (Intel GPU) shell"
	echo "For more information visit: https://github.com/jwhitehorn/ai-intel-gpu"
	echo ""
	echo "The following SYCL devices have been discovered:"
	sycl-ls
	echo ""
	touch /root/.already_ran
fi

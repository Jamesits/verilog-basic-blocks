#!/bin/bash
set -euv

exec djtgcfg prog -d $1 -i 0 -f $2

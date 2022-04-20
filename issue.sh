#!/usr/bin/env bash

export DAGGER_LOG_FORMAT=plain
export DAGGER_CACHE_PATH=.dagger-cache

dagger \
  do \
  --cache-from type=local,src=${DAGGER_CACHE_PATH} \
  --cache-to type=local,mode=max,dest=${DAGGER_CACHE_PATH} \
  test

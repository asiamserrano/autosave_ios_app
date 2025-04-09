#!/bin/bash
git add \*.swift
git commit -m "${1:-updates}"  
git push
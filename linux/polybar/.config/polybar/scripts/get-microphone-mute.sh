#!/bin/bash

amixer get Capture | tail -1 | cut -d'[' -f 3 | cut -d']' -f1 | tr '[:lower:]' '[:upper:]'
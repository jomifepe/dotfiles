#!/bin/bash

# Installing the compton fork with kawase blur effect
git clone https://github.com/tryone144/compton.git
cd compton && make && make docs && make install
cd .. && rm -rf compton
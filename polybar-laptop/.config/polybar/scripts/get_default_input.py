#!/bin/python

import sys
import pulsectl

pulse = pulsectl.Pulse()
default_source_name = pulse.server_info().default_source_name
default_source = pulse.get_source_by_name(default_source_name)
if default_source.mute == 0:
	print('')
else:
	print('ﳌ')
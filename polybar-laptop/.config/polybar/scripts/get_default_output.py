#!/bin/python

import pulsectl

headphones = 'Arctis_7-00.analog-stereo'
speakers = 'pci-0000_00_14.2'
hdmi = 'hdmi-stereo'

pulse = pulsectl.Pulse()
default_output = pulse.get_sink_by_name(pulse.server_info().default_sink_name)
default_source = pulse.get_source_by_name(pulse.server_info().default_source_name)

if headphones in default_output.name:
	print('' if default_output.mute == 0 else 'ﳌ', end = " ")
elif speakers in default_output.name:
	print('蓼' if default_output.mute == 0 else '遼', end = " ")
elif hdmi in default_output.name:
	print('度' if default_output.mute == 0 else 'ﴹ', end = " ")
else:
	print('', end =" ")

print('' if default_source.mute == 0 else '')
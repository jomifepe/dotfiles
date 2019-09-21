#!/bin/python

import sys
import pulsectl

_sinks = [
	'alsa_output.usb-SteelSeries_SteelSeries_Arctis_7-00.analog-stereo',
	'alsa_output.pci-0000_00_14.2.analog-stereo'
	'alsa_output.pci-0000_00_14.2.analog-stereo'
]

pulse = pulsectl.Pulse()
defaultSink = pulse.server_info().default_sink_name
sink_inputs = pulse.sink_input_list()

sinks = pulse.sink_list()
for sink in sinks:
	print(sink.name)

# for i in sink_inputs:
# 	pulse.sink_input_move(i.index, 2)
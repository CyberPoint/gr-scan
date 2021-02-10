#
#	gr-scan - A GNU Radio signal scanner
#	Copyright (C) 2012  Nicholas Tomlinson
#	
#       Modified 2019 CyberPoint International
#
#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	(at your option) any later version.
#	
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#	
#	You should have received a copy of the GNU General Public License
#	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
#
GCC=g++
VERSION=20191013
CXXFLAGS=-DVERSION="\"gr-scan $(VERSION)\"" -std=c++11 -Wall -I/usr/include -I/usr/local/include -I/pybombs/include -O2 -Wno-unused-function
LDFLAGS=-L/pybombs/lib -losmodsp -lgnuradio-audio -lhackrf -lvolk -lgnuradio-iqbalance -lgnuradio-fcdproplus -lgnuradio-uhd -luhd -lbladeRF -lairspy -lairspyhf -lSoapySDR -lgnuradio-pmt -lgnuradio-runtime -lgnuradio-blocks -lgnuradio-fft -lgnuradio-filter -lgnuradio-osmosdr -lboost_system

gr-scan: *.cpp *.hpp
	$(GCC) $(CXXFLAGS) -o gr-scan main.cpp $(LDFLAGS)

clean:
	rm -f gr-scan gr-scan.tar.gz

dist:
	mkdir gr-scan-$(VERSION)
	cp *.cpp *.hpp Makefile COPYING gr-scan-$(VERSION)
	tar -cf - gr-scan-$(VERSION) | gzip -9 -c - > gr-scan-$(VERSION).tar.gz
	rm -r gr-scan-$(VERSION)

import serial
import urllib2
import time

EMAIL = 'katrinamarielee@gmail.com'
HOST = 'http://localhost:3000/submit_reading'

STABLE_TIME = 1.0

ser = serial.Serial('/dev/cu.usbmodem1411', 9600)

last_sent_reading = 0.0
last_reading = 0.0
last_change = 0

while True:
    line = float( ser.readline().rstrip() )
    print line


    # if it's different from the reading we sent (by some min value?)
    if last_reading != line:
        last_change = time.time()
        # if reading is stable for at least a second

    if time.time() - last_change > STABLE_TIME and line != last_sent_reading and last_reading > 0.005:
        print 'DIFF! (submit)'
        querystring = '?email=' + EMAIL + '&reading=' + str(line)
        urllib2.urlopen(HOST + querystring).read()
        last_sent_reading = line

    last_reading = line

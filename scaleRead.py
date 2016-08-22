import serial
import urllib2

EMAIL = 'katrinamarielee@gmail.com'
HOST = 'http://localhost:3000/submit_reading'

ser = serial.Serial('/dev/cu.usbmodem1411', 9600)

while True:
    line = ser.readline()
    print line
    if True:  #when time to send
        querystring = '?email=' + EMAIL + '&reading=' + line.rstrip('\n')
        urllib2.urlopen(HOST + querystring).read()

# http://localhost:3000/submit_reading?e=email&reading=123.4

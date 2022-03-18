import csv
import urllib2

url = 'https://steamdb.info/sales/?min_reviews=0&min_rating=85&min_discount=0'

response = urllib2.urlopen(url)
cr = csv.reader(response)

for row in cr:
    print (row)
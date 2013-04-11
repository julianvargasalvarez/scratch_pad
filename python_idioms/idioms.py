infile = open("/dev/null")
pythons = infile.readlines()
pythons.sort()
[x.strip() for x in pythons]

infile = open('/dev/null')
[x.strip() for x in sorted(infile)]

with open('file.txt', 'w') as f:
    n = f.write('sometext')

import sys
from StringIO import StringIO
class redirect_stdout:
    def __init__(self, target):
        self.stdout = sys.stdout
        self.target = target

    def __enter__(self):
        sys.stdout = self.target

    def __exit__(self, type, value, tb):
        sys.stdout = self.stdout

out = StringIO()
with redirect_stdout(out):
    print('Test')

out.getvalue() == 'Test\n'

from contextlib import closing
import urllib

book_url = "http://python3porting.com/"
with closing(urllib.urlopen(book_url)) as page:
    print(len(page.readlines()))

print('I {0} Python {1}'.format('a', 3))

def allcombinations(starters, endings):
    result = []
    for s in starters:
        for e in endings:
            result.append(s+e)
    return result

print(allcombinations([1,2],[3,4]))

def allcombinations(starters, endings):
    for s in starters:
        for e in endings:
            yield s+e

print(list(allcombinations([1,2],[3,4])))

print(sum([x*x for x in xrange(2000000)]))
print(sum(x*x for x in xrange(2000000)))

(x for x in 'Silly Walk')

print( list(x for x in 'Silly Walk') )

department = 'Silly Walk'
print( {x: department.count(x) for x in department} )

from fractions import Fraction
print( Fraction(3,4) / Fraction('2/3') )

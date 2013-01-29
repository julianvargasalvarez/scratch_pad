
# Karatsuba multiplication
# asumptions: both numbers are integer with equal length,
# length is even.
def karatsuba(first, second)
  x = first.to_s
  y = second.to_s

  n = x.length
  return first * second if n == 1

  n2 = n / 2

  a = x[0,n2].to_i
  b = x[n2,n].to_i
  
  c = y[0,n2].to_i
  d = y[n2,n].to_i

  (10**n) * karatsuba(a, c) + (10**n2) * (karatsuba(a, d) + karatsuba(b, c)) + karatsuba(b, d)
end

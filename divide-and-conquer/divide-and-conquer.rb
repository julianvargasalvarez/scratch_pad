data = File.read('data.txt').gsub("\r", "").split("\n")
n = data.count

def split_count(data, n)
    return {inversions: 0, data: data} if n == 1

    array_a = data[0, n/2]
    array_b = data[n/2, n-1]

    da = split_count(array_a, array_a.count)
    db = split_count(array_b, array_b.count)

    a = da[:data]
    b = db[:data]

    i = 0
    j = 0
    d = []
    k = 0

    inversions = da[:inversions] + db[:inversions]

    while k < n
      if should_copy_a(a[i], b[j])
          d << a[i]
          i += 1
      elsif b[j]
          d << b[j]
          j += 1
          inversions += (a.count - i)
      end
      k += 1
    end

    return {inversions: inversions, data: d}
end

def should_copy_a(a, b)
  a and !b || (a and b and a.to_i < b.to_i)
end

puts split_count(data, n)[:inversions]

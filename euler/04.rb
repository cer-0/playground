#!/usr/bin/env ruby

111.step 999 do |i|
  111.step 999 do |j|
    mult = (i * j).to_s
    l = mult.length
    c = 0
    0.step ((l / 2) - 1) do |k|
      break if mult[k] != mult[-k -1]
      c += 1
    end
    if c == (l / 2) and l >= 6
      print "#{mult}\n"
    end
  end
end

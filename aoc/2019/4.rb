#!/usr/bin/env ruby

vpc = 0
(ARGV[0].to_i..ARGV[1].to_i).each do |p|
  ps = p.to_s
  ddc, idc, mxn = 0, 1, ps[0] # double/increasing digit condition
  (1..ps.length-1).step do |n|
    idc = 0 if ps[n-1].to_i > ps[n].to_i
    ddc = 1 if ps[n-1].to_i == ps[n].to_i
  end
  vpc += 1 if idc + ddc == 2
end
p "Found #{vpc} valid passwords!"

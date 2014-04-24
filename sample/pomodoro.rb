require "jigen"

def sec_to_s(sec)
  m = sec / 60
  s = sec - (m * 60)
  "%2d:%02d"%[m, s]
end

rest = Jigen::Timer.create(25) do
  tick do |sec|
    print "\e[12DWork | " + sec_to_s(sec)
  end
end

work = Jigen::Timer.create(5) do
  tick do |sec|
    print "\e[12DRest | " + sec_to_s(sec)
  end
end

[rest, work].cycle.each {|timer| timer.run}

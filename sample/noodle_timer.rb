require "jigen"

Jigen::Timer.run(180) do
  before do
    puts "Start."
  end

  tick do |sec|
    m = sec / 60
    s = sec - (m * 60)
    print "\e[5D%2d:%02d"%[m, s]
  end

  after do
    print "\n"
    puts "Eat noodle."
  end
end

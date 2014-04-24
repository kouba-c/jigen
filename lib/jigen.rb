require "jigen/version"

module Jigen
  class Timer
    def self.create(time_limit, &block)
      timer = self.new(time_limit)
      timer.instance_eval(&block)
      timer
    end

    def self.run(time_limit, &block)
      create(time_limit, &block).run
    end

    def initialize(time_limit)
      @time_limit = time_limit
      @events = {}
    end

    #generate callback setter
    [:before, :tick, :after].each do |name|
      define_method(name) do |&callback|
        @events[name] = callback
      end
    end

    def hook(event_name, *args)
      @events[event_name].call(*args) if @events[event_name]
    end

    def run
      hook :before
      @time_limit.times do |sec|
        hook :tick, sec
        sleep(1)
      end
      hook :after
    end
  end
end

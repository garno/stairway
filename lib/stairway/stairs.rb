require 'observer'

module Stairway
  class Stairs
    include Observable

    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def steps
      @steps
    end

    def steps=(steps)
      @steps = steps

      @steps.each do |name, klass|
        add_observer(klass)
      end
    end

    def run(options={})
      @steps.each do |name, klass|
        begin
          klass.run

          changed
          notify_observers(klass.context, klass.options)
        rescue Stairway::Stop
          exit
        end
      end
    end

  end
end

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

    def run(context={}, options={})
      notify(context, options)

      @steps.each do |name, klass|
        begin
          klass.run
          notify(klass.context, klass.options)
        rescue Stairway::Stop
          exit
        end
      end
    end

  protected

    def notify(context, options)
      changed
      notify_observers(context, options)
    end

  end
end

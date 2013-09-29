module Stairway
  class Step

    attr_accessor :context, :options

    def initialize
      @context = {}
    end

    def update(context, options)
      @context = context
      @options = options
    end

  end
end

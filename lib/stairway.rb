require 'observer'

require "stairway/stairs"
require "stairway/step"
require "stairway/stop"

require "stairway/version"

module Stairway

  @@stairs = {}

  def self.register(stairs)
    @@stairs.merge! stairs.name.to_sym => stairs
  end

  def self.mount(stairs_name)
    @@stairs[stairs_name]
  end

  def self.stop
    raise Stop
  end

end

require "stairway/stairs"
require "stairway/step"
require "stairway/version"

# Exceptions
require "stairway/exceptions/unregistered_stairs"
require "stairway/exceptions/stop"

module Stairway

  @@stairs = {}

  def self.register(*stairs)
    stairs.each do |s|
      @@stairs.merge! s.name.to_sym => s
    end
  end

  def self.mount(stairs_name)
    raise UnregisteredStairs unless @@stairs.include?(stairs_name)

    @@stairs[stairs_name]
  end

  def self.stop
    raise Stop
  end

end

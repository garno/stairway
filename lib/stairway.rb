require "stairway/stairs"
require "stairway/step"
require "stairway/version"

# Exceptions
require "stairway/exceptions/stop"
require "stairway/exceptions/unregistered_stairs"
require "stairway/exceptions/invalid_stairs_object"

module Stairway

  @@stairs = {}

  def self.register(*stairs)
    stairs.each do |s|
      if valid_stairs?(s)
        @@stairs.merge! s.name.to_sym => s
      else
        raise InvalidStairsObject
      end
    end

    true
  end

  def self.mount(stairs_name)
    raise UnregisteredStairs unless @@stairs.include?(stairs_name)

    @@stairs[stairs_name]
  end

  def self.stop
    raise Stop
  end

protected

  def self.valid_stairs?(stairs)
    stairs.respond_to?(:name)
  end

end

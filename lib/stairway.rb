require "stairway/version"
require_relative "stairway/stairs.rb"

module Stairway

  @@stairs = {}

  def self.register(stairs)
    @@stairs.merge! stairs.name.to_sym => stairs
  end

  def self.mount(stairs_name)
    @@stairs[stairs_name]
  end

end

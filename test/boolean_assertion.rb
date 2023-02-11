# frozen_string_literal: true

require 'minitest/assertions'

module Minitest
  module Assertions
    def assert_kind_of_boolean(value)
      assert value.is_a?(FalseClass) || value.is_a?(TrueClass)
    end
  end
end

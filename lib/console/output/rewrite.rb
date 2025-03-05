# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023-2024, by Samuel Williams.

require "wrapper"
class Rewrite < Console::Output::Wrapper
  REWRITE = {
    event: true,
  }

  def call(*arguments, **options, &block)
    options.transform_keys! do |key|
      if REWRITE.include?(key)
        "console:#{key}"
      else
        key
      end
    end

    super
  end
end

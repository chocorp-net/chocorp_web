# frozen_string_literal: true

require 'test_helper'

class ModTest < ActiveSupport::TestCase
  def check_mod(mod)
    assert mod.name.is_a? String and mod.name.length.positive?
    assert mod.webpage.is_a? String and mod.webpage.length.positive?
    assert mod.desc.is_a? String and mod.desc.length.positive?
    assert mod.logo.is_a? String and mod.logo.length.positive?
  end

  test 'All fields are set' do
    Mod.all.each do |mod|
      check_mod mod
    end
  end
end

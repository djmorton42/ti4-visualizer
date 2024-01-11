# frozen_string_literal: true

module GameCodeGenerator
  CHARACTER_SET = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
  CODE_LENGTH = 12

  class << self
    def generate
      (1 .. CODE_LENGTH).map do |_|
        CHARACTER_SET[rand(0 ... CHARACTER_SET.length)]
      end.join
    end
  end
end
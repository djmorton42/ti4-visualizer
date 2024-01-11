# frozen_string_literal: true

class Ruleset < ApplicationRecord
  has_many :objectives
  has_many :factions
end
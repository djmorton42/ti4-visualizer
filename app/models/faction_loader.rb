# frozen_string_literal = true

require "csv"

class FactionLoader
  class << self
    def load
      puts "Loading faction CSV"
      
      @faction_map = {}
      @faction_list = []

      File.open("config/factions.csv") do |f|
        CSV.parse(f, headers: true).each do |row|
          faction = FactionLoader.new(name: row["name"], short_name: row["short_name"], version: row["version"])
          @faction_list << faction
          @faction_map[row["name"]] = faction
        end
      end

      @faction_list.sort! { |a, b| a.name <=> b.name }
    end

    def faction_map
      load unless defined?(@faction_map)
      @faction_map
    end

    def faction_list
      load unless defined?(@faction_list)
      @faction_list
    end

    def output_seed
      File.open("faction_seed.rb", "w") do |f|
        faction_list.each do |obj|
          f.puts("Faction.create(name: \"#{obj.name}\", short_name: \"#{obj.short_name}\", ruleset: #{obj.version == 1 ? "pok_rules" : "base_game_rules"})")
        end
      end
    end
  end

  attr_reader :name, :short_name, :version

  def initialize(name:, short_name:, version:) 
    @name = name
    @short_name = short_name
    @version = version
  end
end
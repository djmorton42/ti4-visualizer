# frozen_string_literal = true

require "csv"

class ObjectiveLoader
  class << self
    def load
      puts "Loading objective CSV"
      
      @objective_list = []

      @secret_objectives = []
      @first_stage_objectives = []
      @second_stage_objectives = []

      File.open("config/objectives.csv") do |f|
        CSV.parse(f, headers: true).each do |row|
          objective = Objective.new(
            title: row["title"],
            phase: row["phase"],
            type: row["type"],
            victory_points: row["victory_points"],
            version: row["version"],
            text: row["text"],
            updated_text: row["updated_text"],
          )
          @objective_list << objective

          if objective.type == "Public 1"
            @first_stage_objectives << objective
          elsif objective.type == "Public 2"
            @second_stage_objectives << objective
          elsif objective.type == "Secret"
            @secret_objectives << objective
          end
        end
      end

      @objective_list.sort! { |a, b| a.title <=> b.title }
      @first_stage_objectives.sort! { |a, b| a.title <=> b.title }
      @second_stage_objectives.sort! { |a, b| a.title <=> b.title }
      @secret_objectives.sort! { |a, b| a.title <=> b.title }
    end

    def objective_list
      load unless defined?(@objective_list)
      @objective_list
    end

    def first_stage_objectives
      load unless defined?(@objective_list)
      @first_stage_objectives
    end

    def second_stage_objectives
      load unless defined?(@objective_list)
      @second_stage_objectives
    end

    def secret_objectives
      load unless defined?(@objective_list)
      @secret_objectives
    end

    def generate_game_objectives
      load unless defined?(@objective_list)
      @game_objectives = []
      @game_objectives += first_stage_objectives.shuffle.take(5)
      @game_objectives += second_stage_objectives.shuffle.take(5)
    end

    def output_seed
      File.open("objective_seed.rb", "w") do |f|
        objective_list.each do |obj|
          f.puts("Objective.create(title: \"#{obj.title}\", phase: \"#{obj.phase}\", type: \"#{obj.type}\", text: \"#{obj.text}\", victory_points: #{obj.victory_points}, ruleset: #{obj.version == 1 ? "pok_rules" : "base_game_rules"})")
        end
      end
    end
  end

  attr_reader :title, :phase, :type, :victory_points, :version, :text, :updated_text

  def initialize(title:, phase:, type:, victory_points:, version:, text:, updated_text:) 
    @title = title
    @phase = phase
    @type = type
    @victory_points = victory_points.to_i
    @version = version.to_i
    @text = text
    @updated_text = updated_text
  end
end

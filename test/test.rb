require 'minitest/autorun'


class ReporterPersonalizado<Minitest::AbstractReporter
  def start
    puts "\n--- Inicio de Tests ---\n\n"
  end

  def record(result)
    nombre = result.name.gsub('test_', '').gsub('_', ' ')
    
    if result.passed?
      puts "  ✔️  #{nombre}"
    else
      puts "  ❌  #{nombre}"
      puts "     └─ Error: #{result.failures.first.message}"
    end
  end
end


module Minitest
  def self.plugin_personalizado_init(options)
    self.reporter.reporters.clear
    self.reporter << ReporterPersonalizado.new
  end
end

Minitest.extensions << 'personalizado'

class TestGeneradorHorario < Minitest::Test

end



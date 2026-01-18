require 'minitest/autorun'
require_relative '../lib/generador_horario/obt_datos.rb'

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
  def test_acepta_archivo_csv
    GeneradorHorario::comprobar_ext("trabajadores.csv")
  end

  def test_rechaza_archivo_no_csv
    assert_match(/debe ser .csv/, assert_raises(ArgumentError){GeneradorHorario::comprobar_ext("trabajadores.txt")}.message)
  end
end
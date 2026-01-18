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

  def test_nombre_trabajador_valido
    GeneradorHorario::comprobar_nTrabajador("Juan Pérez")
    GeneradorHorario::comprobar_nTrabajador("Ana María López")
    GeneradorHorario::comprobar_nTrabajador("José Ángel Rodríguez")
    GeneradorHorario::comprobar_nTrabajador("Óscar Fernández Rodríguez")
    GeneradorHorario::comprobar_nTrabajador("María José Carreño Quiñones")
  end

  def test_nombre_trabajador_no_valido
    assert_match(/no es un nombre valido/, assert_raises(ArgumentError){GeneradorHorario::comprobar_nTrabajador("Juan")}.message)
    assert_match(/no es un nombre valido/, assert_raises(ArgumentError){GeneradorHorario::comprobar_nTrabajador("Ana María López García Fernández")}.message)
    assert_match(/no es un nombre valido/, assert_raises(ArgumentError){GeneradorHorario::comprobar_nTrabajador("12345")}.message)
    assert_match(/no es un nombre valido/, assert_raises(ArgumentError){GeneradorHorario::comprobar_nTrabajador("Juan @Pérez")}.message)
  end

  def test_seccion_valida
    GeneradorHorario::comprobar_Seccion(:pescadería)
    GeneradorHorario::comprobar_Seccion(:panadería)
    GeneradorHorario::comprobar_Seccion(:fruta)
    GeneradorHorario::comprobar_Seccion(:charcutería)
    GeneradorHorario::comprobar_Seccion(:carnicería)
  end

  



end
require 'minitest/autorun'
require_relative '../lib/generador_horario/obt_datos.rb'
require 'set'

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

  def test_seccion_no_valida
    assert_match(/no es una sección valida/, assert_raises(GeneradorHorario::Dominio::SeccionNoValida){GeneradorHorario::comprobar_Seccion(:droguería)}.message)
    assert_match(/no es una sección valida/, assert_raises(GeneradorHorario::Dominio::SeccionNoValida){GeneradorHorario::comprobar_Seccion(:carniceria)}.message)
    assert_match(/no es una sección valida/, assert_raises(GeneradorHorario::Dominio::SeccionNoValida){GeneradorHorario::comprobar_Seccion(:electronica)}.message)
    assert_match(/no es una sección valida/, assert_raises(GeneradorHorario::Dominio::SeccionNoValida){GeneradorHorario::comprobar_Seccion("fruta")}.message)
  end

  def test_leer_archivo_devuelve_un_numero_correcto_de_lineas
      file1=GeneradorHorario::leer_archivo("docs/datos_entrada_validos.csv")
      file2=GeneradorHorario::leer_archivo("docs/datos_entrada_menor.csv")
      file3=GeneradorHorario::leer_archivo("docs/datos_entrada_vacio.csv")
      assert_equal(25, file1.size)
      assert_equal(12, file2.size)
      assert_equal(0, file3.size)
  end

  def test_obtener_datos_trabajador_devuelve_objeto_correcto
      resultado=GeneradorHorario::obtener_datos_trabajador("Juan Pérez, pescadería", 0)
      assert_equal(0, resultado[:id])
      assert_equal("Juan Pérez", resultado[:trabajador].nombre_y_apellidos)
      assert_equal(:pescadería, resultado[:seccion])
  end

  def test_obtener_datos_trabajador_entrada_invalida
      assert_match(/no es un nombre valido/, assert_raises(ArgumentError){GeneradorHorario::obtener_datos_trabajador("Juan, pescadería", 0)}.message)
      assert_match(/no es una sección valida/, assert_raises(GeneradorHorario::Dominio::SeccionNoValida){GeneradorHorario::obtener_datos_trabajador("Juan Pérez, droguería", 0)}.message)
  end

  def test_procesar_datos_devuelve_conjunto_correcto
      file=[
        "Juan Pérez, pescadería",
        "Ana María López, panadería",
        "José Ángel Rodríguez, fruta"
      ]
      resultado=GeneradorHorario::procesar_datos(file)
      assert_equal(3, resultado.size)
      juan=resultado.find do |datos_trabajador|
        datos_trabajador[:trabajador].nombre_y_apellidos=="Juan Pérez" &&
        datos_trabajador[:seccion]==:pescadería &&
        datos_trabajador[:id]==0
      end
      ana=resultado.find do |datos_trabajador|
        datos_trabajador[:trabajador].nombre_y_apellidos=="Ana María López" &&
        datos_trabajador[:seccion]==:panadería &&
        datos_trabajador[:id]==1
      end
      jose=resultado.find do |datos_trabajador|
        datos_trabajador[:trabajador].nombre_y_apellidos=="José Ángel Rodríguez" &&
        datos_trabajador[:seccion]==:fruta &&
        datos_trabajador[:id]==2
      end

      refute_nil(juan, "No se encontró a el primer trabajador en el conjunto de datos procesados")
      refute_nil(ana, "No se encontró a el segundo trabajador en el conjunto de datos procesados")
      refute_nil(jose, "No se encontró a el tercer trabajador en el conjunto de datos procesados")
  end

  def test_procesar_datos_devuelve_conjunto_vacio
      file=[]
      resultado=GeneradorHorario::procesar_datos(file)
      assert_empty(resultado)
  end

  def test_procesar_datos_con_entrada_invalida
      file1=[
        "Juan, pescadería",
        "Ana María López, panadería"
      ]
      file2=[
        "Juan Pérez, pescadería",
        "Ana María López, droguería"
      ]
      assert_match(/no es un nombre valido/, assert_raises(ArgumentError){GeneradorHorario::procesar_datos(file1)}.message)
      assert_match(/no es una sección valida/, assert_raises(GeneradorHorario::Dominio::SeccionNoValida){GeneradorHorario::procesar_datos(file2)}.message)
  end

  def test_comprobar_numero_trabajadores_en_seccion_valido
    trabajadores_set=Set.new
    for i in 1..5
      trabajadores_set.add({id: i, trabajador: GeneradorHorario::Dominio::Trabajador.new("Trabajador #{i}"), seccion: :pescadería})
    end
    GeneradorHorario::comprobar_num_TrabajSeccion(trabajadores_set, :pescadería)
  end

  def test_comprobar_numero_trabajadores_en_seccion_con_entrada_vacia
    trabajadores_set=Set.new
    assert_match(/no tiene el número mínimo de trabajadores/, assert_raises(GeneradorHorario::Dominio::RequisitosNunMinPersonas){GeneradorHorario::comprobar_num_TrabajSeccion(trabajadores_set, :pescadería)}.message)
  end

  def test_comprobar_numero_trabajadores_en_seccion_con_menos_de_5
    trabajadores_set=Set.new
    for i in 1..4
      trabajadores_set.add({id: i, trabajador: GeneradorHorario::Dominio::Trabajador.new("Trabajador #{i}"), seccion: :pescadería})
    end
    assert_match(/no tiene el número mínimo de trabajadores/, assert_raises(GeneradorHorario::Dominio::RequisitosNunMinPersonas){GeneradorHorario::comprobar_num_TrabajSeccion(trabajadores_set, :pescadería)}.message)
  end

  def test_comprobar_numero_trabajadores_totales_validos
    trabajadores_set=Set.new
    for seccion in GeneradorHorario::SECCIONES
      for i in 1..5
        trabajadores_set.add({id: i, trabajador: GeneradorHorario::Dominio::Trabajador.new("Trabajador #{i}"), seccion: seccion})
      end
    end
    GeneradorHorario::comprobar_num_Trabajadores(trabajadores_set)
  end

  def test_comprobar_numero_trabajadores_totales_con_entrada_vacia
    trabajadores_set=Set.new
    assert_match(/no tiene el número mínimo de trabajadores/, assert_raises(GeneradorHorario::Dominio::RequisitosNunMinPersonas){GeneradorHorario::comprobar_num_Trabajadores(trabajadores_set)}.message)
  end

  def test_comprobar_numero_trabajadores_totales_invalido 
    trabajadores_set=Set.new
    for seccion in GeneradorHorario::SECCIONES
      for i in 1..4
        trabajadores_set.add({id: i, trabajador: GeneradorHorario::Dominio::Trabajador.new("Trabajador #{i}"), seccion: seccion})
      end
    end
    assert_match(/no tiene el número mínimo de trabajadores/, assert_raises(GeneradorHorario::Dominio::RequisitosNunMinPersonas){GeneradorHorario::comprobar_num_Trabajadores(trabajadores_set)}.message)
  end

end
require 'set'

module GeneradorHorario
  module Dominio
    class Horario
      attr_reader :asignaciones

      def initialize
        @asignaciones = Hash.new { |hash, key| hash[key] = Set.new }
      end

      def agregar_empleado(dia, turno, seccion, empleado)
      end

      def obtener_empleados(dia, turno, seccion)
      end
    end
  end
end
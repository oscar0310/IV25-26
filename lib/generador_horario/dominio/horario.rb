require 'set'

module GeneradorHorario
  module Dominio
    class Horario
      attr_reader :trabajadores_en_seccion_dia_y_turno

      def initialize
        @trabajadores_en_seccion_dia_y_turno = Hash.new { |hash, key| hash[key] = Set.new }
      end

    end
  end
end
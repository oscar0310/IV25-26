module GeneradorHorario
  module Dominio
    class DiaNoValido < ArgumentError; end
    class TurnoNoValido < ArgumentError; end
    class SeccionNoValida < ArgumentError; end
    class EmpleadoYaAsignado < StandardError; end
  end
end
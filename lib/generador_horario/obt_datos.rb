require_relative "generador_horario.rb"
require_relative "dominio/errores.rb"
require 'set'
module GeneradorHorario
    module_function

    def leer_archivo(archivo)
        file=File.readlines(archivo).drop(1)
    end

    def procesar_datos(file)
        trabajadores_set=Set.new[]
        file.each do |linea|
            datos_trabajador=obtener_datos_trabajador(linea)
            trabajadores_set.add(datos_trabajador)
        end
        trabajadores_set
    end

    def obtener_datos_trabajador(linea)
        columnas=linea.split(',')
        nombre_trabajador=columnas[0].strip
        seccion=columnas[1].strip.downcase.to_sym
        comprobar_nTrabajador(nombre_trabajador)
        comprobar_Seccion(seccion)
    end

    def comprobar_ext(archivo)
        if File.extname(archivo) != ".csv"
            raise ArgumentError, "El archivo de con la información de los trabajadores debe ser .csv (se recibió: #{archivo})."
        end
    end  
    
    def comprobar_nTrabajador(nombre)
        formato1=/^[a-zA-ZáéíóúñÑ]+\s+[a-zA-ZáéíóúñÑ]+$/
        formato2=/^[a-zA-ZáéíóúñÑ]+\s+[a-zA-ZáéíóúñÑ]+\s+[a-zA-ZáéíóúñÑ]+$/

        unless nombre=~formato1 || nombre=~formato2
            raise ArgumentError, "El nombre: #{nombre} pasado en el archivo de entrada no es un nombre valido, tiene que seguir el formato nombre apellido o nombre apellido1 apellido2"
        end
    end

    def comprobar_Seccion(seccion)
        unless SECCIONES_VALIDAS.include?(seccion)
         raise Dominio::SeccionNoValida, "La sección #{seccion} pasada en el archivo de entrada no es una sección valida, las secciones validas son: #{SECCIONES_VALIDAS.join(', ')}"  
        end 
    end
end
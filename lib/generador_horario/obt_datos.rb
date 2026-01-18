require_relative "generador_horario.rb"
require_relative "dominio/errores.rb"
require 'set'
require_relative "dominio/trabajador.rb"
module GeneradorHorario
    module_function
    def obtener_datos(archivo)
        comprobar_ext(archivo)
        file=leer_archivo(archivo)
        trabajadores_set=procesar_datos(file)
        comprobar_num_Trabajadores(trabajadores_set)
        trabajadores_set   
    end

    def leer_archivo(archivo)
        File.readlines(archivo).drop(1)
    end

    def procesar_datos(file)
        trabajadores_set=Set.new[]
        file.each_with_index do |linea, id|
            datos_trabajador=obtener_datos_trabajador(linea, id)
            trabajadores_set.add(datos_trabajador)
        end
        trabajadores_set
    end

    def obtener_datos_trabajador(linea, id)
        columnas=linea.split(',')
        nombre_trabajador=columnas[0].strip
        seccion=columnas[1].strip.downcase.to_sym
        comprobar_nTrabajador(nombre_trabajador)
        comprobar_Seccion(seccion)

        trabajador_obj=Dominio::Trabajador.new(nombre_trabajador)

        {
            id: id,
            trabajador: trabajador_obj,
            seccion: seccion
        }
    end

    def comprobar_ext(archivo)
        if File.extname(archivo) != ".csv"
            raise ArgumentError, "El archivo de con la información de los trabajadores debe ser .csv (se recibió: #{archivo})."
        end
    end  
    
    def comprobar_nTrabajador(nombre)
        formato1=/^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+\s+[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$/
        formato2=/^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+\s+[a-zA-ZáéíóúÁÉÍÓÚñÑ]+\s+[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$/
        formato3=/^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+\s+[a-zA-ZáéíóúÁÉÍÓÚñÑ]+\s+[a-zA-ZáéíóúÁÉÍÓÚñÑ]+\s+[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$/

        unless nombre=~formato1 || nombre=~formato2 || nombre=~formato3
            raise ArgumentError, "El nombre: #{nombre} pasado en el archivo de entrada no es un nombre valido, tiene que seguir el formato nombre apellido o nombre apellido1 apellido2"
        end
    end

    def comprobar_Seccion(seccion)
        unless SECCIONES.include?(seccion)
         raise Dominio::SeccionNoValida, "La sección #{seccion} pasada en el archivo de entrada no es una sección valida, las secciones validas son: #{SECCIONES.join(', ')}"  
        end 
    end

    def comprobar_num_Trabajadores(trabajadores_set)
        for seccion in SECCIONES
            comprobar_num_TrabajSeccion(trabajadores_set, seccion)
        end
    end

    def comprobar_num_TrabajSeccion(trabajadores_set, seccion)
        trabajadores_en_seccion = trabajadores_set.select{ |t| t[:seccion] == seccion }
        if trabajadores_en_seccion.size < 5
            raise Dominio::RequisitosNunMinPersonas, "La sección #{seccion} no tiene el número mínimo de trabajadores requeridos (5)."
        end
    end 
end
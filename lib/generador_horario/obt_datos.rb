module GeneradorHorario
    module_function
     def comprobar_ext(archivo)
        if File.extname(archivo) != ".csv"
            raise ArgumentError, "El archivo de con la información de los trabajadores debe ser .csv (se recibió: #{archivo})."
        end
    end  
end
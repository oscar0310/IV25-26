require 'rake'

task default: :check

task  :check do
    #Buscamos todos los .rb
    FileList['**/*.rb'].each do |file|
        #ejecutamos la opción -c de ruby que chequea la sintaxis
        sh "ruby -c #{file}"
    end
end


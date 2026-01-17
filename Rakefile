require 'rake'
require 'rake/testtask'

task default: :check

task  :check do
    #Buscamos todos los .rb
    FileList['**/*.rb'].each do |file|
        #ejecutamos la opción -c de ruby que chequea la sintaxis
        sh "ruby -c #{file}"
    end
end

Rake::TestTask.new do |t|
    t.libs<<"test"
    t.libs<<"lib"
    t.test_files=FileList['test/test*.rb']
    t.verbose=true
end





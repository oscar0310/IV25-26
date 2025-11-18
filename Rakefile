require 'rake'
require 'rubocop/rake_task' #Importamos la tarea oficial de Rubocop

desc "Compureba la sintaxis de las entidades"
RuboCop::RakeTask.new(:check) do |tarea|
    tarea.fail_on_error = false #Falla si hay errores
end

task :default => [:check] #Tarea por defecto al ejecutar solo 'rake'
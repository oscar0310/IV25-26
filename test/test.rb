require 'minitest/autorun'


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




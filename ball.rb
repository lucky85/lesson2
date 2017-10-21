require 'yaml'

class Ball
  ANSWERS = YAML.load_file('answers.yml')

  def shake
    index = rand(20)
    answer = ANSWERS[index]
    colors = [34, 32, 33, 31]
    puts "\e[#{colors[index / 5]}m#{answer}\e[0m"
    answer
  end
end

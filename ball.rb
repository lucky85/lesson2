require 'yaml'

class Ball
  ANSWERS = YAML.load_file('answers.yml')
  def shake
    index = rand(ANSWERS.size - 1)
    answer = ANSWERS[index]
    colors = [31, 32, 33, 34]
    puts "\e[#{colors[index / 5]}m#{answer}\e[0m"
    answer
  end
end

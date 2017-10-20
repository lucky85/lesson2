require 'yaml'

class Ball
  ANSWERS = YAML.load_file('answers.yml')
  def shake
    answer = ANSWERS[rand(20)]
    colors = [34, 32, 33, 31]
    puts "\e[#{colors[ANSWERS.index(answer) / 5]}m#{answer}\e[0m"
    answer
  end
end

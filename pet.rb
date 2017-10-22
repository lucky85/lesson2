class Pet
  def initialize
    p 'Назовите питомца'
    @name = gets.chomp
    @life = 0
    @asleep = 0
    @mood = 10
    @hunger = 10
    @stuff_in_intestine = 0
    puts @name + ' родился.'
    game
  end

  def game
    puts "Введите команду или 'help' для подсказки: "
    command = gets.chomp
    case command
    when 'exit'
      puts 'Goodbye!'
      return
    when 'help'
      help
      game
    when 'feed'
      feed
    when 'walk'
      walk
    when 'sleep'
      sleep
    when 'toss'
      toss
    when 'watch'
      watch
    else
      p 'неправильная команда'
      game
    end
  end

  def help
    p 'feed - покормить питомца'
    p 'walk - выгулять питомца'
    p 'sleep - уложить спать питомца'
    p 'toss - подбросить питомца'
    p 'watch - наблюдать за питомцем'
    p 'exit - выход'
  end

  def feed
    puts 'Вы кормите ' + @name + '.'
    if @hunger + 5 < 10
      @hunger += 5
    else
      @hunger = 10
    end
    @mood += 1
    passage_of_time(3)
  end

  def walk
    puts 'Вы выгуливаете ' + @name + '.'
    @stuff_in_intestine = 0
    passage_of_time(2)
  end

  def sleep
    puts 'Вы укладываете ' + @name + ' спать.'
    if @asleep - 5 < 0
      @asleep = 0
    else
      @asleep -= 5
    end
    passage_of_time(5)
  end

  def toss
    puts 'Вы подбрасываете ' + @name + ' в воздух.'
    puts 'Он хихикает, его настроение поднимается'
    if @mood < 10
      @mood += 5
    else
      @mood = 10
    end
    passage_of_time(1)
  end

  def watch
    puts 'Вы наблюдаете за' + @name
    passage_of_time(1)
  end

  private

  def hungry?
    @hunger <= 2
  end

  def poopy?
    @stuff_in_intestine >= 8
  end

  def mood?
    @mood <= 0
  end

  def life?
    @life >= 100
  end

  def asleep?
    @asleep <= 0
  end

  def passage_of_time(time)
    @life += time
    @mood -= 2
    @asleep += 1
    puts 'В желудке у ' + @name + ' урчит...' if hungry?
    if @hunger > 0
      @hunger -= 1
      @stuff_in_intestine += 1
    else
      puts @name + ' проголодался! И убежал от ВАС!'
      return
    end
    if @stuff_in_intestine >= 10
      @stuff_in_intestine = 0
      puts 'Опаньки!  ' + @name + ' сделал нехорошо...'
    end
    if @asleep >= 15
      puts @name + ' очень устал и уснул'
      @asleep = 0
    end
    puts @name + ' подпрыгивает, потому что хочет на горшок...' if poopy?
    if mood?
      puts @name + ' загрустил и убежал от вас'
      return
    end
    if life?
      puts @name + ' умер от старости'
      return
    end
    puts "cытость: #{@hunger} // сонливость: #{@asleep} // возраст: #{@life} // радость: #{@mood} // выгуляность:): #{@stuff_in_intestine}"
    game
  end
end

Pet.new

class Day2

  def run
    lines = %w{LRULLRLDUUUDUDDDRLUDRDLDDLUUDLDDLRDRLDRLLURRULURLDRLDUDURLURRULLDDDUDDRRRDLRRDDLDURDULLRDLLLDRDLLDULDUDLLDLDRUDLLDLDDRRRDRLUDRDDLUDRRDUDUDLLDDUUDLRDUDRRUDUDRULRULUDRUUDLDLULLRLDLDDRULLRLLLULUULDURURLUUULDURLDDDURRUUDURDDDULDLURLRDRURDRUDRLLDLDRUURLLLRDRURUDLRLUDULLDDURLRURDLRDUUURRLULRRLDDULUUURLRRRLLLLLURDDRUULUDRRRUDDLLULRRUULDRDDULRLDDDRRUULUDRLRUDURUUULDLDULUUDURLLLRRDDRDLURDDDLDDDLRDRLDDURLRLLRUDRRLLDDDDDURDURRDDULDULLRULDRUURDRRDUDDUDDDDRRDULDUURDRUDRLDULRULURLLRRDRDRDLUUDRRLRLDULDDLUUUUUURRLRRRULLDDDRLRDRRRRRRRDUUDLLUDURUDDLURRUDL
UDUUURRLRLLDDRRDRRRLDDDLURURLLUDDRLUUDRRRDURRLLRURDLLRRDUUDDDDRDRURRLLLLURDLRRRULLLDLLLUDDLDRRRDLDUUDDRDUDDUURDDLULULDURDURDRUULURURRURDUURUDRRUDRLLLLRRDLLDRDDRLLURDDDUDUDUDRUURDDRUURDLRUUDDRDUURUDDLLUURDLUDRUUDRRDLLUUURDULUULDUUDLLULUUDLUDRUUDUUURLDDDRLRURDDULLRDRULULUDLUUDDDUUDLDUUDRULLDUURDDRUDURULDRDDLRUULRRRDLDLRDULRDDRLLRRLURDLDRUDLRLUDLRLDLDURRUULRLUURDULDRRULLRULRDLLDLDUDRUDDUDLDDURDDDRDLUDRULRUULLRURLDDDRDLRRDRULURULDULRDLDULDURDRDRDRDURDRLUURLRDDLDDRLDDRURLLLURURDULDUDDLLUURDUUUDRUDDRDLDRLRLDURRULDULUUDDLRULDLRRRRDLLDRUUDRLLDLUDUULRDRDLRUUDLRRDDLUULDUULRUDRURLDDDURLRRULURR
LDURLLLRLLLUURLLULDLRLLDLURULRULRDUDLDDUDRLRRDLULLDDULUUULDRLDURURLURLDLRUDULLLULDUURLLRDLUULRULLLULRDRULUDLUUULDDURLUDDUDDRDLDRDRUDLUURDDLULDUULURLUULRDRDLURUDRUDLDRLUUUUULUDUDRRURUDRULDLDRDRLRURUUDRDLULLUDLLRUUDUUDUDLLRRRLDUDDDRDUDLDLLULRDURULLLUDLLRUDDUUDRLDUULLDLUUDUULURURLLULDUULLDLUDUURLURDLUULRRLLRUDRDLLLRRRLDDLUULUURLLDRDLUUULLDUDLLLLURDULLRUDUUULLDLRLDRLLULDUDUDRULLRRLULURUURLRLURRLRRRDDRLUDULURUDRRDLUDDRRDRUDRUDLDDRLRDRRLDDRLLDDDULDLRLDURRRRRULRULLUUULUUUDRRDRDRLLURRRRUULUDDUDDDLDURDRLDLLLLLRDUDLRDRUULU
URURRUUULLLLUURDULULLDLLULRUURRDRRLUULRDDRUDRRDUURDUDRUDDRUULURULDRLDRDDDLDLRLUDDRURULRLRLLLDLRRUDLLLLRLULDLUUDUUDRDLRRULLRDRLRLUUDDRRLLDDRULLLRLLURDLRRRRRLLDDRRDLDULDULLDLULLURURRLULRLRLLLLURDDRDDDUUDRRRDUUDDLRDLDRRLLRURUDUUUDLDUULLLRLURULRULRDRLLLDLDLRDRDLLLRUURDDUDDLULRULDLRULUURLLLRRLLLLLLRUURRLULRUUUDLDUDLLRRDDRUUUURRRDRRDULRDUUDULRRRDUUUUURRDUURRRRLDUDDRURULDDURDDRDLLLRDDURUDLLRURLRRRUDDLULULDUULURLUULRDLRDUDDRUULLLRURLDLRRLUDLULDRLUDDDRURUULLDLRLLLDULUDDRLRULURLRDRRDDLDLURUDDUUURRDDLUDDRDUULRRDLDRLLLULLRULRURULRLULULRDUD
RUDLLUDRRDRRLRURRULRLRDUDLRRLRDDUDRDLRRLLRURRDDLRLLRRURULRUULDUDUULDULDLRLRDLRDLRUURLDRLUDRRDDDRDRRRDDLLLRRLULLRRDDUDULRDRDUURLDLRULULUDLLDRUDUURRUDLLRDRLRRUUUDLDUDRRULLDURRDUDDLRURDLDRLULDDURRLULLRDDDRLURLULDLRUDLURDURRUDULDUUDLLLDDDUUURRRDLLDURRDLULRULULLRDURULLURDRLLRUUDDRRUDRDRRRURUUDLDDRLDRURULDDLLULULURDLDLDULLRLRDLLUUDDUDUDDDDRURLUDUDDDRRUDDLUDULLRDLDLURDDUURDLRLUUDRRULLRDLDDDLDULDUDRDUUULULDULUDLULRLRUULLDURLDULDRDLLDULLLULRLRD}

    @position = {x: 1, y: 1}
    digits = []

    lines.each do |line|
      line.chars.each do |direction|
        move(direction)
      end
      digits << number
    end

    puts "Part 1: #{digits.join}"
  end

  def move(direction)
    case direction
    when 'L'
      @position[:x] = [@position[:x]-1,0].max
    when 'R'
      @position[:x] = [@position[:x]+1,2].min
    when 'U'
      @position[:y] = [@position[:y]-1,0].max
    when 'D'
      @position[:y] = [@position[:y]+1,2].min
    end
  end

  def number
    @position[:x] + 1 + (@position[:y] * 3)
  end
end

Day2.new.run
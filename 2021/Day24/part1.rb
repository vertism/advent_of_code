class Day24
  attr_accessor :input

  def initialize
    @input = File.open('input').readlines.map(&:strip)
    @value = 0
  end

  def run
    w = 0
    x = 0
    y = 0
    z = 0

    9.downto(1).each do |n|
      process(0, n, w, x, y, z)
    end
  end

  def process(i, n, w, x, y, z, current = "")
    from = i * 18
    to = from + 18

    @input[from..to].each do |ins|
      parts = ins.split
      case parts[0]
      when "inp"
        w = n
      when "add"
        w, x, y, z = add(parts[1], parts[2], w, x, y, z)
      when "mul"
        w, x, y, z = mul(parts[1], parts[2], w, x, y, z)
      when "div"
        w, x, y, z = div(parts[1], parts[2], w, x, y, z)
      when "mod"
        w, x, y, z = mod(parts[1], parts[2], w, x, y, z)
      when "eql"
        w, x, y, z = eql(parts[1], parts[2], w, x, y, z)
      end
    end

    if i == 13
      return z.zero?
    else
      9.downto(1).each do |m|
        if process(i + 1, m, w, x, y, z, "#{current}#{n}")
          p "#{current}#{n}#{m}"
          raise
        end
      end
    end

    false
  end

  def add(a, b, w, x, y, z)
    case b
    when "w"
      value = w
    when "x"
      value = x
    when "y"
      value = y
    when "z"
      value = z
    else
      value = b.to_i
    end

    case a
    when "w"
      w += value
    when "x"
      x += value
    when "y"
      y += value
    when "z"
      z += value
    end

    [w, x, y, z]
  end

  def mul(a, b, w, x, y, z)
    case b
    when "w"
      value = w
    when "x"
      value = x
    when "y"
      value = y
    when "z"
      value = z
    else
      value = b.to_i
    end

    case a
    when "w"
      w *= value
    when "x"
      x *= value
    when "y"
      y *= value
    when "z"
      z *= value
    end

    [w, x, y, z]
  end

  def div(a, b, w, x, y, z)
    case b
    when "w"
      value = w
    when "x"
      value = x
    when "y"
      value = y
    when "z"
      value = z
    else
      value = b.to_i
    end

    case a
    when "w"
      w /= value
    when "x"
      x /= value
    when "y"
      y /= value
    when "z"
      z /= value
    end

    [w, x, y, z]
  end

  def mod(a, b, w, x, y, z)
    case b
    when "w"
      value = w
    when "x"
      value = x
    when "y"
      value = y
    when "z"
      value = z
    else
      value = b.to_i
    end

    case a
    when "w"
      w = w.remainder(value)
    when "x"
      x = x.remainder(value)
    when "y"
      y = y.remainder(value)
    when "z"
      z = z.remainder(value)
    end

    [w, x, y, z]
  end

  def eql(a, b, w, x, y, z)
    case b
    when "w"
      value = w
    when "x"
      value = x
    when "y"
      value = y
    when "z"
      value = z
    else
      value = b.to_i
    end

    case a
    when "w"
      w = w == value ? 1 : 0
    when "x"
      x = x == value ? 1 : 0
    when "y"
      y = y == value ? 1 : 0
    when "z"
      z = z == value ? 1 : 0
    end

    [w, x, y, z]
  end
end

Day24.new.run

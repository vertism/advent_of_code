class Day16
  attr_accessor :start, :versions, :bin

  def run
    input = File.open('input').readlines.map(&:strip)[0]
    @bin = to_binary(input)
    p @bin

    @start = 0
    @versions = []
    parse
    p versions.sum
  end

  def parse
    return if bin.length <= start
    version = bin.byteslice(start, 3).to_i(2)
    versions << version
    type_id = bin.byteslice(start + 3, 3).to_i(2)
    if type_id == 4 # literal
      @start += 6
      bin_num = ""
      loop do
        bin_num << bin.byteslice(start + 1, 4)
        if bin[start] == "0"
          @start += 5
          break
        else
          @start += 5
        end
      end
      number = bin_num.to_i(2)
      p "literal: #{number}"
    else # operator
      p "operator"
      length_type_id = bin.byteslice(start + 6, 1).to_i(2)
      if length_type_id == 0
        total_length = bin.byteslice(start + 7, 15).to_i(2)
        p "length: #{total_length}"
        @start += 22
        current_start = start
        while start < current_start + total_length
          parse
        end
        p "length: end"
      else
        contained_sub_packets = bin.byteslice(start + 7, 11).to_i(2)
        p "subs: #{contained_sub_packets}"
        @start += 18
        contained_sub_packets.times do
          parse
        end
        p "subs: end"
      end
    end
  end

  def to_binary(packet)
    packet.hex.to_s(2).rjust(packet.size*4, '0')
  end
end

Day16.new.run

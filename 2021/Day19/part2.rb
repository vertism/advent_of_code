class Day19
  attr_accessor :scanners

  def initialize
    input = File.open('input').readlines.map(&:strip)
    @scanners = []
    scanner = {}
    input.each_with_index do |line, i|
      if line.size == 0 || i == input.size - 1
        @scanners << scanner
      elsif line.start_with?('---')
        scanner = {}
      else
        scanner[line.split(',').map(&:to_i)] = []
      end
    end
  end

  def translations_1
    [
      [0,1,2], [0,2,1], [1,0,2], [1,2,0], [2,0,1], [2,1,0]
    ]
  end

  def translations_2
    [
      [1,1,1], [1,-1,1], [1,1,-1], [1,-1,-1], [-1,1,1], [-1,-1,1], [-1,1,-1], [-1,-1,-1]
    ]
  end

  def map_beacons(scanner)
    scanner.each do |beacon_a, _|
      distances = []
      scanner.each do |beacon_b, _|
        next if beacon_a == beacon_b
        distances << calc_distance(beacon_a, beacon_b)
      end
      scanner[beacon_a] = distances
    end
  end

  def run
    scanner_locations = []

    scanners.map do |scanner|
      map_beacons(scanner)
    end

    done = [0]

    while done.size < scanners.size do
      scanners.each_with_index do |scanner_a, i|
        next unless done.include?(i)
        scanners.each_with_index do |scanner_b, j|
          next if done.include?(j)

          matches = []
          scanner_a.each do |a_point, a_distances|
            scanner_b.each do |b_point, b_distances|
              if (a_distances & b_distances).size == 11
                matches << [a_point, b_point]
              end
            end
          end

          if matches.size == 12
            transform = find_transform(matches[0], matches[1])
            scanner_locations << transform[0]
            transformed = scanner_b.keys.map do |beacon|
              0.upto(2).map do |i|
                (beacon[transform[1][i]] * transform[2][i]) + transform[0][i]
              end
            end
            scanners[j] = {}
            transformed.each do |val|
              scanners[j][val] = []
            end
            map_beacons(scanners[j])
            done << j
          end
        end
      end
    end

    beacons = []
    scanners.each do |scanner|
      beacons.concat(scanner.keys)
    end

    max_man = 0

    scanner_locations.each do |loc_a|
      scanner_locations.each do |loc_b|
        distance = manhattan(loc_a, loc_b)
        if distance > max_man
          max_man = distance
        end
      end
    end

    p max_man
  end

  def find_transform(first, second)
    transform = []

    translations_1.each do |trans1|
      break if transform.size.positive?
      translations_2.each do |trans2|
        compare_1 = 0.upto(2).map do |i|
          first[0][i] - (first[1][trans1[i]] * trans2[i])
        end
        compare_2 = 0.upto(2).map do |i|
          second[0][i] - (second[1][trans1[i]] * trans2[i])
        end

        if compare_1 == compare_2
          transform = [compare_1, trans1, trans2]
          break
        end
      end
    end

    transform
  end

  def calc_distance(p, q)
    p = [p].flatten
    q = [q].flatten
    ::Math.sqrt(p.zip(q).inject(0) { |sum, coord| sum + (coord.first - coord.last)**2 })
  end

  def manhattan(a, b)
    (a[0] - b[0]).abs + (a[1] - b[1]).abs + (a[2] - b[2]).abs
  end
end

Day19.new.run

#!/usr/bin/env ruby

input = File.open('input').readlines.map(&:strip)

deliveries = [["start"]]

journeys = [
  input[0].chars.each_slice(2).map(&:first).to_a,
  input[0].chars.each_slice(2).map(&:last).to_a
]

location_x = 0
location_y = 0

journeys.each do |journey|
  deliveries.each_with_index do |row, x|
    row.each_with_index do |col, y|
      if col == "start"
        location_x = x
        location_y = y
      end
    end
  end

  journey.each do |ins|
    case ins
    when 'v'
      if location_x.zero?
        deliveries.prepend([])
      else
        location_x -= 1
        deliveries[location_x] = [] unless deliveries[location_x]
      end
    when '>'
      location_y += 1
    when '^'
      location_x += 1
      deliveries[location_x] = [] unless deliveries[location_x]
    when '<'
      if location_y.zero?
        deliveries.each do |row|
          row.prepend(nil)
        end
      else
        location_y -= 1
      end
    end
    deliveries[location_x][location_y] = true unless deliveries[location_x][location_y] == "start"
  end
end

total = 0

deliveries.each do |row|
  row.each do |col|
    total += 1 if col
  end
end

p total

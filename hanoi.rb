require_relative 'hanoi_game'

disk_count = ARGV[0] ? ARGV[0] : "3"
visualization_speed = ARGV[1] ? ARGV[1] : "5"

if ARGV.size <= 2 and disk_count.match?(/^\d+$/) and visualization_speed.match?(/^\d+$/) then
  hanoi_game = HanoiGame.new(disk_count.to_i, visualization_speed.to_i)
  hanoi_game.run()
else
  puts "\e[31mUsage:\e[0m"
  puts "\e[96mruby hanoi.rb\e[0m \e[32m[disk_count]\e[0m \e[95m[visualization_speed]\e[0m"
  puts "\e[91mArguments should be integers equal or greater than 0"
  puts "Setting\e[0m \e[95mvisualization_speed\e[0m \e[91mto 0 skips the animation and only shows the final result\e[0m"
end

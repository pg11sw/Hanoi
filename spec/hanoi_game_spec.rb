require 'rspec'
require_relative '../hanoi_game.rb'

RSpec.describe HanoiGame do
  describe '#check if the number of moves is correct' do
    it 'run the game with 5 disks' do
      hanoi_game = HanoiGame.new(5, 0)
      moves = hanoi_game.run()
      expect(moves).to eq(31)
    end
    it 'run the game with 12 disks' do
      hanoi_game = HanoiGame.new(12, 0)
      moves = hanoi_game.run
      expect(moves).to eq(4095)
    end
    it 'run the game with 15 disks' do
      hanoi_game = HanoiGame.new(15, 0)
      moves = hanoi_game.run
      expect(moves).to eq(32767)
    end
  end
end

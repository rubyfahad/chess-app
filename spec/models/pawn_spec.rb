require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe 'valid_move?' do
    it 'should return true if a white pawn is moving 2 squares north for its first move' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id)
      pawn = Pawn.create(move_number: 0, x_position: 0, y_position: 6, game_id: game.id, user_id: white_user.id)
      expect(pawn.valid_move?(0,4)).to be true
    end

    it 'should return false if white pawn moving 2 squares north for its second move' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id)
      pawn = Pawn.create(move_number: 1, x_position: 0, y_position: 4, game_id: game.id, user_id: white_user.id)
      expect(pawn.valid_move?(0,2)).to be false
    end

    it 'should return true if white pawn moving 1 square north for any move' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id)
      pawn = Pawn.create(move_number: 3, x_position: 7, y_position: 5, game_id: game.id, user_id: white_user.id)
      expect(pawn.valid_move?(7,4)).to be true
    end

    it 'should return true if black pawn moving 2 squares south for its first move' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id)
      pawn = Pawn.create(move_number: 0, x_position: 0, y_position: 1, game_id: game.id, user_id: black_user.id)
      expect(pawn.valid_move?(0,3)).to be true
    end

    it 'should return false if black pawn moving 2 squares south for its second turn' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id)
      pawn = Pawn.create(move_number: 1, x_position: 0, y_position: 3, game_id: game.id, user_id: black_user.id)
      expect(pawn.valid_move?(0,5)).to be false
    end

    it 'should return true if black pawn moving 1 square south for any move' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id)
      pawn = Pawn.create(move_number: 3, x_position: 7, y_position: 2, game_id: game.id, user_id: black_user.id)
      expect(pawn.valid_move?(7,3)).to be true
    end

    it 'should return false if black pawn is making a random move' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id)
      pawn = Pawn.create(move_number: 2, x_position: 7, y_position: 2, game_id: game.id, user_id: black_user.id)
      expect(pawn.valid_move?(4,3)).to be false
    end
  end
end

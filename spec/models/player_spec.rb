require 'rails_helper'

RSpec.describe Player do
  describe 'titled_name' do
    it 'is a master' do
      player = create(:master, name:'João')
      expect(player.name).to eq 'João'
      expect(player.titled_name).to eq 'Mestre João'
      expect(player.titled_name).not_to eq 'Jogador João'
    end

    it 'is not a master' do
      player = create(:player, name:'João')
      expect(player.name).to eq 'João'
      expect(player.titled_name).not_to eq 'Mestre João'
      expect(player.titled_name).to eq 'Jogador João'
    end
  end
end

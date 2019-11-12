# frozen_string_literal: true

class CampaignsController < ApplicationController
  before_action :authenticate_player!, only: %i[index]
  before_action :authenticate_master!, only: %i[index]

  def index
    @campaigns = Campaign.where(player: current_player)
  end

  private

  def authenticate_master!
    redirect_to root_path unless current_player.master?
  end
end

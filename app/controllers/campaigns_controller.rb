# frozen_string_literal: true

class CampaignsController < ApplicationController
  before_action :authenticate_player!, only: %i[authenticate_master!]
  before_action :authenticate_master!, only: %i[index show]

  def index
    @campaigns = Campaign.where(player: current_player)
  end

  def show
    @campaign = Campaign.find(params[:id])
    redirect_to root_path unless @campaign.player == current_player
  end

  private

  def authenticate_master!
    redirect_to root_path unless current_player.master?
  end
end

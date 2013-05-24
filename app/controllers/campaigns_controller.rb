class CampaignsController < ApplicationController

  expose :team
  expose :campaign, :attributes => :campaign_params

  def update
    existing_campaign = Campaign.by_slug(campaign_slug)

    if existing_campaign.present?
      campaign = existing_campaign
      campaign.save!
    end

    team.set_campaign!(campaign)

    redirect_to edit_campaign_path(team, page: "goals"), :notice => "Zapisano!"
  end

  private
    def campaign_slug
      campaign_params.fetch(:slug)
    end

    def campaign_params
      params.require(:campaign).permit(:slug)
    end
end

class VoteController < ApplicationController
  def cast
    # ToDo - check if already voted
    # make new vote or update existing vote track id
    @vote = Vote.new(
      :soundcloud_track_id => params[:soundcloud_track_id],
      :user_id => current_sc_user[:id],
      :battle_id => params[:battle_id]
    )
    if @vote.save
      redirect_to "/battle/show/#{params[:battle_id]}"
    else
      render :text => "Vote error."
    end
  end
end

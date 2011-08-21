class BattleController < ApplicationController
  def index
    @battles = Battle.all
  end

  def show
    @battle = Battle.find_by_id(params[:id])

    if logged_in?
      @hide_join_button = !!@battle.tracks.find(:first, :conditions => [ "user_id = ?", @current_sc_user.id])
    else
      @hide_join_button = true
    end
  end

  def create
    @battle = Battle.new()
    @battle.save
  end

end

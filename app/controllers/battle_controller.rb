class BattleController < ApplicationController
  def index
    @battles = Battle.all
  end

  def show
    @battle = Battle.find_by_id(params[:id])
    @battles_users = @battle.users
  end

  def create
    @battle = Battle.new()
    @battle.save
    @battle.users.push(@current_sc_user) 
  end

end

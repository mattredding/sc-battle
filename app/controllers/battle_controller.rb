class BattleController < ApplicationController
  def index
    @battles = Battle.all
  end

  def show
    @battle = Battle.find_by_id(params[:id])
  end

  def create
    @battle = Battle.new()
    @battle.save
  end

end

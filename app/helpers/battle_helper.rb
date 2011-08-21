module BattleHelper
  def is_contestant?(battle_id)
    if logged_in?
      Battle.find(battle_id).users.find(:first, :conditions => {:id => current_sc_user[:id]}) ? true : false
    else
      false
    end
  end
end

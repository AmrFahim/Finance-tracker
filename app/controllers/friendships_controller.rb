class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "You are NOW following this #{friend.full_name}"
      redirect_to my_friends_path
    else  
      flash[:alert] = "There are something wrong"
      redirect_to my_friends_path
    end
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy 
    flash[:notice] = "You are NOT following this user Now"
    redirect_to my_friends_path
  end
end

class EpicenterController < ApplicationController
def feed
	@following_tweets = []
	if current_user != nil 
Tweet.all.each do |tweet|
		if current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id
			@following_tweets.push(tweet)
      # if the user is following someone they will see their tweets in their feed, along with their own.
		end
	end
else 
	redirect_to new_user_session_path
	end
end

  def show_user
  	@user = User.find(params[:id])
# to show the user's profile, found by searching the user's ID which is hidden
  end

  def now_following
  	current_user.following.push(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(id: params[:id])

  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(id: params[:id])

  end

  def tag_tweets
    @tag = Tag.find(params[:id])
  end

  def all_users
  @users = User.order(:name)
  end
def following
@user = User.find(params[:id])
@users = []
User.all.each do |user|
if @user.following.include?(user.id)
@users.push(user)
end
end
end
def followers
@user = User.find(params[:id])
@users = []
User.all.each do |user|
if user.following.include?(@user.id)
@users.push(user)
end
end
end
end
  

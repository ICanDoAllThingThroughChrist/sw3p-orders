class AdminController < ???????
    def index 
        @users = User.all 
    # filter @orders list based on user iput 
    if !params[:user].blank 
        @orders = Post.by_author(params[:user])
    elsif !params[:date].blank?
        
end
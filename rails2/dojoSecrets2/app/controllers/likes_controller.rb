class LikesController < ApplicationController
    def create
        @user = User.find_by(id: session["user_id"])
        @secret = Secret.find_by(id: params[:secretid])
        @like = Like.new(user:@user, secret:@secret)
        if @like.valid?
            @like.save
            puts "********successfully liked*********"
            p@like
            redirect_to "/secrets/" + @secret.id.to_s
        else
            puts "*******failed*******"
            redirect_to "/secrets/" + @secret.id.to_s
        end
    end
    def destroy
        @secret = Secret.find_by(id: params[:secretid])
        @like = @secret.likes.find_by(user: User.find_by(id: session["user_id"]))
        if @like
            @like.destroy
            puts "********successfully destroyed*********"
            redirect_to "/secrets/" + @secret.id.to_s
        else
            puts "********failed*********"
            redirect_to "/secrets/" + @secret.id.to_s
        end
    end
end

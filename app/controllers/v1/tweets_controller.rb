class V1::TweetsController < ApplicationController
    def create
        user = User.find(params[:id])
        tweet = user.tweets.create(tweet_params)
        if tweet.save
            render json: { status: "Succes", 
                message: "Tweet berhasil dipost", result: tweet}, status: :created #201
        else
            render json: {status: "Failed", 
            message: "Tweet Gagal dipost"},status: :unprocessable_entity #status code
        end
    end
    def show
        user = User.find(params[:id])
        tweet = user.tweets.find(params[:tweets_id])
        render json: {tweet: tweet.content,user: user.name },status: :ok

    end
    def showall
        user = User.find(params[:id])
        tweet = user.tweets.all()
        render json: {tweet: tweet,user: user.name },status: :ok

    end
    private
    def tweet_params
        params.permit(:content)#whiteListing parameter
    end
end
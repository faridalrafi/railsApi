class V1::UsersController < ApplicationController
    def create
        user = User.create(user_params)#ORM 
        # user.password_confirmation = user.password
        if user.save
            render json: { status: "Succes", 
                message: "User berhasil dibuat", result: user}, status: :created #201
        else
            render json: {status: "Failed", 
            message: "User Gagal dibuat"},status: :unprocessable_entity #status code
        end
    end

    def update
        user = User.update(user_params)#ORM untuk update
        # user.password_confirmation = user.password
        if user.save
            render json: { status: "Succes", 
                message: "User berhasil diupdate", result: user}, status: :ok 
        else
            render json: {status: "Failed", 
            message: "User Gagal diupdate"},status: :unprocessable_entity #status code
        end
    end
    def index
        users = User.all #ORM
        render json: users, status: :ok

    end
    def show
        user = User.find(params[:id])
        #user = User.find_by(id: params[:name])
        render json: user, status: :ok
    end

    def delete
        user = User.find(params[:id])
        user.destroy
        head 204
    end

    private
    def user_params
        params.permit(:email, :password, :name)#whiteListing parameter
    end
end
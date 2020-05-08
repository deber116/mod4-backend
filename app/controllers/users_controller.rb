class UsersController < ApplicationController
    def create
        user_info = JSON.parse(request.body.string)["username"]
        user = User.find_or_create_by(username: user_info)
        render json: user
    end
end
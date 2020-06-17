class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

    def index
        users = User.all
        render json: users.to_json(:include => {
            :price_lists => {:only => [:id, :vendor_id, :date]}
            }, except: [:created_at, :updated_at]) 
    end

    def show
        user = User.find_by({id: params[:id]}) 
        if user
            render json: user.to_json(:include => {
                :price_lists => {:only => [:id, :vendor_id, :date]}
            }, except: [:created_at, :updated_at])       
        else
            render json: {message: "sorry friend, no info here"}
        end
    end

  def create
    user = User.create(user_params) 
    if user.valid?
        payload = {user_id: user.id}
        token = encode_token(payload)
        puts token
        render json: {user: user, jwt: token}
    else
        render json: {errors: user.errors.full_messages}, status: :not_acceptable
    end
  end

  private 

  def user_params
    params.permit(:username, :password)
  end
end

class ItemDetailsController < ApplicationController
    # Remove comment below to test end point without authentication
    # skip_before_action :require_login
  

    def index
        item_details = ItemDetail.all
            render json: item_details.to_json(:include => {
                :item => {:only => [:id, :name]},
                :user => {:only => [:id, :username]},
                :vendor => {:only => [:id, :name]}
            }, except: [:created_at, :updated_at]) 
    end

    def show
        item_detail = ItemDetail.find_by({id: params[:id]}) 
        if item_detail
            render json: item_detail.to_json(:include => {
                :user => {:only => [:id, :username]},
                :items => {:only => [:id, :name]},
                :item_details => {:only => [:id, :pack_size, :price, :item_id, :item_name]},
                :vendor => {:only => [:id, :name]}
            }, except: [:created_at, :updated_at])    
        else
            render json: {message: "sorry friend, no info here"}
        end
    end

    def create 
        item_detail = ItemDetail.create(item_detail_params)
        render json: item_detail
    end

    def update

    end

    def destroy
        item_detail = ItemDetail.find_by({id: params[:id]}) 
        item_detail.destroy
    end

private

    def item_detail_params
        params.require(:item_detail).permit(:price_list_id, :item_id, :pack_size, :price, :item_name)
    end

    
end

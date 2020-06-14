class ItemsController < ApplicationController
    # Remove comment below to test end point without authentication
    skip_before_action :require_login


    def index
        items = Item.all
        render json: items.to_json(:include => {
            :item_details => {:only => [:id, :price, :pack_size, :item_id, :price_list_id, :item_name]},
            :price_lists => {:only => [:vendor_id, :date, :id]}
            }, except: [:created_at, :updated_at])   
    end

    def show
        item = Item.find_by({id: params[:id]}) 
        if item
            render json: item.to_json(:include => {
                :item_details => {:only => [:id, :price, :pack_size, :item_id, :price_list_id, :item_name]},
                :price_lists => {:only => [:vendor_id, :date, :id]}
            }, except: [:created_at, :updated_at])    
        else
            render json: {message: "sorry friend, no info here"}
        end
    end

    def create 
        item = Item.create(item_params)
        render json: item
    end

    def update

    end

    def destroy
        item = Item.find_by({id: params[:id]}) 
        item.destroy
    end

private

    def item_params
        params.require(:item).permit(:name)
    end
end


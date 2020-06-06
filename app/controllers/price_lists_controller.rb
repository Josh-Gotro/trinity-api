class PriceListsController < ApplicationController
    #Remove comment below to test end point without authentication
    # skip_before_action :require_login

    def index
        price_lists = PriceList.all
            render json: price_lists.to_json(:include => {
                :user => {:only => [:id, :username]},
                :items => {:only => [:id, :name]},
                :item_details => {:only => [:id, :pack_size, :price, :item_id]},
                :vendor => {:only => [:id, :name]}
            }, except: [:created_at, :updated_at]) 
    end

    def show
        price_list = PriceList.find_by({id: params[:id]}) 
        if price_list
            render json: price_list.to_json(:include => {
                :user => {:only => [:id, :username]},
                :items => {:only => [:id, :name]},
                :item_details => {:only => [:id, :pack_size, :price, :item_id]},
                :vendor => {:only => [:id, :name]}
            }, except: [:created_at, :updated_at])    
        else
            render json: {message: "sorry friend, no info here"}
        end
    end

    def create 
        price_list = PriceList.create(pricelist_params)
        render json: price_list
    end

    def update

    end

    def destroy
        price_list = PriceList.find_by({id: params[:id]}) 
        price_list.destroy
    end

private

    def pricelist_params
        params.require(:price_list).permit(:user_id, :vendor_id, :date)
    end
end
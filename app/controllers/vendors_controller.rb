class VendorsController < ApplicationController
    # Remove comment below to test end point without authentication
    # skip_before_action :require_login

    def index
        vendors = Vendor.all
        render json: vendors.to_json(:include => {
            :price_lists => {:only => [:id,:vendor_id, :user_id, :date]}
            }, except: [:created_at, :updated_at]) 
    end

    def show
        vendor = Vendor.find_by({id: params[:id]}) 
        if vendor
            render json: vendor.to_json(:include => {
                :price_lists => {:only => [:id, :vendor_id, :user_id, :date]}
            }, except: [:created_at, :updated_at])       
        else
            render json: {message: "sorry friend, no info here"}
        end
    end

    def create 
        vendor = Vendor.create(vendor_params)
        render json: vendor
        # if vendor.valid?
        #     render json: vendor
        # else
        #             render json: {errors: vendor.errors.full_messages}
    end

    def update

    end

    def destroy
        vendor = Vendor.find_by({id: params[:id]}) 
        vendor.destroy
    end

private

    def vendor_params
        params.require(:vendor).permit(:user_id, :name, :description, :rep, :contact)
    end
end

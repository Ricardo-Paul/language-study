class PubsController < ApplicationController

    before_action :find_pub, only: [:show, :edit, :update, :destroy]

    def index
        @pubs = Pub.all
        #@pubs = Pub.all.order("updated_at DESC")
    end

    def show 
    end

    def new 
        @pub = Pub.new
    end

    def create
        @pub = Pub.create(pub_params)
       # raise @pub.inspect
        redirect_to pubs_path
    end

    def edit
    end

    def update
        @pub.update(pub_params)
        redirect_to pubs_path
    end

    def destroy
        @pub.destroy
        redirect_to pubs_path
    end

    private
    def pub_params
        params.require(:pub).permit(:content)
    end

    def find_pub 
        @pub = Pub.find(params[:id])
    end
end

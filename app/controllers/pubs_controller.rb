class PubsController < ApplicationController

    before_action :find_pub, only: [:show, :edit, :update, :destroy]

    def index
        @pubs = Pub.all
        #aise params[:type].inspect
        #@pubs = Pub.all.order("updated_at DESC")
        if params[:type]
            @type_id = Type.find_by(name: params[:type]).id
            @pubs = Pub.where(type_id: @type_id)
        end
    end

    def show 
    end

    def new 
        #@pub = Pub.new
        @pub = current_user.pubs.build
        @types = Type.all.map{ |t| [t.name, t.id] }
    end

    def create
        @pub = Pub.create(pub_params)
        @pub.type_id = params[:type_id]
        @pub.user_id = current_user.id
        @pub.save
       # raise @pub.inspect
        redirect_to pubs_path
    end

    def edit
    end

    def update
        @pub.type_id = params[:type_id]
        @pub.update(pub_params)
        redirect_to pubs_path
    end

    def destroy
        @pub.destroy
        redirect_to pubs_path
    end

    private
    def pub_params
        params.require(:pub).permit(:content, :type_id)
    end

    def find_pub 
        @pub = Pub.find(params[:id])
    end
end

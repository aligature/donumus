class GiftsController < ApplicationController
   def new
      @gift = Gift.new(:list_id => params[:list_id])
   end

   def create
      if @gift = Gift.create(gift_params)
         redirect_to User.view_user(session)
      else
         render :new
      end
   end

   def show
      @gift = Gift.find(params[:id])
   end

   def index
      @gifts = Gift.all
   end

   def edit
      @gift = Gift.find(params[:id])
   end

   def update
      @gift = Gift.find(params[:id])

      if @gift.update(gift_params)
         redirect_to User.view_user(session)
      else
         render 'edit'
      end
   end

   private
   def gift_params
      params.require(:gift).permit(:description, :link, :list_id, :added_by_user_id, :starred)
   end
end

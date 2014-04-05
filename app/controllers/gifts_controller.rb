class GiftsController < ApplicationController
   def new
      #@gift = Gift.new(:list_id => params[:list_id])
      session[:list_id] = params[:list_id]
   end

   def create
      @gift = Gift.new(gift_params)
      @gift.list_id = session[:list_id]
      if @gift.save
         redirect_to @gift
      else
         render :new
      end
   end

   def show
      puts :id
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
         redirect_to @gift
      else
         render 'edit'
      end
   end

   private
   def gift_params
      params.require(:post).permit(:status, :description, :link)
   end
end

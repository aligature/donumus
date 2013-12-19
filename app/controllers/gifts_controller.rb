class GiftsController < ApplicationController
   def new
      @gift = Gift.new
   end

   def create
      @gift = Gift.new(gift_params)
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

   private
   def gift_params
      params.require(:post).permit(:status, :description, :link)
   end
end

class GiftsController < ApplicationController
   def new
      list = List.find(params[:list_id])
      maybe_redirect(list.check_permissions(current_user))
      @gift = Gift.new(:list_id => list.id)
   end

   def create
      if @gift = Gift.create(gift_params)
         redirect_to User.view_user(session)
      else
         render :new
      end
   end

   def edit
      @gift = Gift.find(params[:id])
      maybe_redirect(@gift.check_permissions(current_user))
   end

   def update
      @gift = Gift.find(params[:id])
      maybe_redirect(@gift.check_permissions(current_user))

      if @gift.update(gift_params)
         redirect_to User.view_user(session)
      else
         render 'edit'
      end
   end

   def destroy
      @gift = Gift.find(params[:id])
      maybe_redirect(@gift.check_permissions(current_user))
      @gift.destroy
      redirect_to User.view_user(session)
   end

   private
   def gift_params
      params.require(:gift).permit(:description, :link, :list_id, :added_by_user_id, :starred)
   end
end

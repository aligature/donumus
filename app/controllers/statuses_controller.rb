class StatusesController < ApplicationController
   def new
      @statuses = Status.statuses
      @status = Status.new(:gift_id => params[:gift_id])
   end

   def create
      @statuses = Status.statuses
      if @status = Status.create(status_params)
         redirect_to User.view_user(session)
      else
         render :new
      end
   end

   def show
      @status = Status.find(params[:id])
   end

   def edit
      @statuses = Status.statuses
      @status = Status.find(params[:id])
   end

   def update
      @statuses = Status.statuses
      @status = Status.find(params[:id])

      if @status.update(status_params)
         redirect_to User.view_user(session)
      else
         render 'edit'
      end
   end

   private
   def status_params
      params.require(:status).permit(:status, :note, :gift_id, :added_by_user_id)
   end
end

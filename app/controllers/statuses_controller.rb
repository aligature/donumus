class StatusesController < ApplicationController
   before_action :check_view_user
   helper_method :status_options

   def new
      @statuses = Status.statuses
      gift = Gift.find(params[:gift_id])
      maybe_redirect(gift.check_permissions(current_user))
      @status = Status.new(:gift_id => gift.id)
   end

   def index
      get_for_gift(params[:gift_id])
   end

   def create
      @status = Status.create(status_params)
      if @status.valid?
         redirect_to User.view_user(session)
      else
         get_for_gift(params[:status][:gift_id])
         render :index
      end
   end

   def edit
      @statuses = Status.statuses
      @status = Status.find(params[:id])
      maybe_redirect(@status.check_permissions(current_user))
   end

   def update
      @statuses = Status.statuses
      @status = Status.find(params[:id])
      maybe_redirect(@status.check_permissions(current_user))

      if @status.update(status_params)
         redirect_to User.view_user(session)
      else
         render 'edit'
      end
   end

   def destroy
      @status = Status.find(params[:id])
      maybe_redirect(@status.check_permissions(current_user))
      @status.destroy
      redirect_to User.view_user(session)
   end

   def status_options
      Status.statuses.select{|s| s != 'available' }.map { |s| [s[0].humanize, s[0]] }
   end

   private
   def status_params
      params.require(:status).permit(:status, :note, :gift_id, :added_by_user_id)
   end

   private
   def get_for_gift(gift_id)
      @gift = Gift.find(gift_id)
      maybe_redirect(@gift.check_permissions(current_user))
      @statuses = @gift.statuses
   end
end

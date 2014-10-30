class UserNotesController < ApplicationController

   def edit
      @note = UserNote.find(params[:id])
      maybe_redirect(@note.check_permissions(current_user))
   end

   def update
      @note = UserNote.find(params[:id])
      maybe_redirect(@note.check_permissions(current_user))

      if @note.update(user_note_params)
         redirect_to user_info_path(User.view_user(session))
      end
   end

   private
   def user_note_params
      params.require(:user_note).permit(:notes)
   end

end

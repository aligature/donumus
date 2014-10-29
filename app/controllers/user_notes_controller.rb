class UserNotesController < ApplicationController
   def update
      @note = UserNote.find(params[:id])
      maybe_redirect(@note.check_permissions(current_user))

      if @note.update(user_note_params)
         puts @note.user_id
         puts @note.notes
         respond_with_bip @note
      end
   end

   private
   def user_note_params
      params.require(:user_note).permit(:notes)
   end
end

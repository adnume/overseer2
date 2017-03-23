class PagesController < ApplicationController
  def dashboard
    @subjects = current_user.subjects.not_deleted
  end

end

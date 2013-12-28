class PersonalController < ApplicationController
  def index
    @temporary_user = get_temporary_user
    if(!@temporary_user)
      flash[:notice] = "Not logged in!"
      redirect_to "/" and return
    end
  end

  def show
    @temporary_user = get_temporary_user
    if(!@temporary_user)
      flash[:notice] = "Not logged in!"
      redirect_to "/" and return
    end
  end

  def edit
    @temporary_user = get_temporary_user
  end
end

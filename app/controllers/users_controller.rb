class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      sign_in @user
      redirect_to root_path, flash: { notice: 'Welcome!' }
    else
      render :new
    end
  end

  def view_invite
    @user = User.find(params[:id])
    @user.update(viewed_invite: true)

    respond_to do |format|
      format.png {
        pixel = "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAFoEvQfAAAABGdBTUEAALGPC/xhBQAAADhlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAAqACAAQAAAABAAAAAaADAAQAAAABAAAAAQAAAADa6r/EAAAAC0lEQVQIHWP4DwQACfsD/Qy7W+cAAAAASUVORK5CYII="
        send_data Base64.decode64(pixel), type: 'image/png', disposition: 'inline'
      }
    end
  end


  private

    def user_params
      params.require(:user).permit(:email)
    end
end
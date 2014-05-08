class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :load_profile

  def edit
  end

  def update
    binding.remote_pry
    @profile.update_attributes(profile_params)

    redirect_to edit_profil_path
  end

  private

  def load_profile
    @profile ||= current_user.profile || current_user.create_profile
  end

  def profile_params
    params.require(:profile).permit!
  end
end

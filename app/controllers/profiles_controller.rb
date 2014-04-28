class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_profile

  def show
    # Not idempotent, but only done on the first pass
    # should probably be done in a signup model
    @profile ||= current_user.create_profile
  end

  def edit
  end

  def update
    @profile.update_attributes(profile_params)
    
    redirect_to profile_path
  end

  private
    def load_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:name, :member_number, :address, :city, :postal_code, :director,
                                      :director_title, :certification_manager, :certification_manager_title,
                                      :telephone, :fax, :email, :website)
    end
end

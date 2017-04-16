class Admin::SettingsController < Admin::ApplicationController
  def new
    if Setting.any?
      redirect_to edit_admin_setting_url(Setting.first)
    else
    @setting = Setting.new
    end
  end

  def create
    @setting = Setting.new(settings_params)
    if @setting.save
    redirect_to edit_admin_setting_url(@setting), notice: 'Setting created successfully'
  else
    flash[:alert] = 'Some problems occur!'
    render :new
    end
  end

  def edit
    @setting = Setting.find(params[:id])

  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update(settings_params)
      redirect_to edit_admin_setting_url(@setting), notice: 'Setting successfully updated'
    else
      flash[:alert] = 'Some problems occur'
      render :edit
    end
  end

  private
  def settings_params
    params.require(:setting).permit(:id, :sitename, :post_per_page, :under_maintenance, :prevent_commenting, :tag_visibility)
  end
end

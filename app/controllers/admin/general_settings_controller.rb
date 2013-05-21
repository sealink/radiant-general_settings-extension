class Admin::GeneralSettingsController < ApplicationController

  def index
    @general_settings = GeneralSetting.all
  end

  def new
    @general_setting = GeneralSetting.new
  end

  def edit
    @general_setting = GeneralSetting.find(params[:id])
  end

  def update
    @general_setting = GeneralSetting.find(params[:id])
    if @general_setting.update_attributes(params[:general_setting])
      flash[:notice] = "The General Text was Updated."
      redirect_to admin_general_settings_path
    else
      flash[:error] = "The General Text was not created."
      render :action => 'edit'
    end
  end

  def create
    @general_setting = GeneralSetting.create(params[:general_setting])
    if @general_setting.save
      flash[:notice] = "The General Text was created."
      redirect_to admin_general_settings_path
    else
      flash[:error] = "The General Text was not created."
      render :action => 'new'
    end
  end

  def destroy
    general_setting = GeneralSetting.find(params[:id])
    general_setting.destroy
    flash[:notice] = "The General Setting was deleted."
    redirect_to admin_general_settings_path
  end

end

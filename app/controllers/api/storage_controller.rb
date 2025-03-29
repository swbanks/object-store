class Api::StorageController < ApplicationController
  before_action :authorize_action

  def create
    file = params[:file]
    filename = params[:filename]
    # filename = file.original_filename
    # Spoofing a service call
    StorageService.upload(file, filename, @current_user)
    render json: { message: "File uploaded successfully", filename: filename }
  end

  def index
    files = StorageService.list(@current_user)
    render json: { files: files }
  end

  def show
    file = StorageService.download(params[:filename], @current_user)
    send_data file, filename: params[:filename]
  end

  def destroy
    StorageService.delete(params[:filename], @current_user)
    render json: { message: "File deleted successfully" }
  end

  def search
    files = StorageService.search(params[:query], @current_user)
    render json: { files: files }
  end

  private
  def authorize_action
    authorize :storage, "#{action_name}?".to_sym
  end
end

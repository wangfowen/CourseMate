class UploadController < ApplicationController
  def index
     render :file => 'app\views\upload\uploadfile.rhtml'
  end
  def uploadFile
    post = DataFile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
end

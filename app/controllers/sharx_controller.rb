class SharxController < ApplicationController
  def index
    @home = Dir.entries(Dir.home)
      .filter{ |f| !f.start_with?(?.) }
      .map{ |f| File.expand_path(f, Dir.home) }
  end

  def show
    curr_path = File.realpath(params[:id], ?/)
    @home = Dir.entries(curr_path)
      .filter{ |f| !f.start_with?(?.) }
      .map{ |f| File.expand_path(f, curr_path) }
  end

  def new
  end

  def create
    pth = File.expand_path("Videos", Dir.home)
    params[:file][1..].each do |file|
      file_temp = file.tempfile.path
      file_name = file.original_filename
      File.open("#{pth}/2 #{file_name}", "wb") do |f|
        f.write(File.read(file_temp, mode: "rb"))
      end
      redirect_to sharx_create_path, status: :see_other, notice: "File sent!"
    end
  end

  def about
  end

  def download
    file_pth = File.expand_path(params[:id], ?/)
    send_file(file_pth, filename: File.basename(file_pth))
  end
end
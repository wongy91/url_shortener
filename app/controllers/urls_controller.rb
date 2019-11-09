class UrlsController < ApplicationController
  def index
    @url = Url.new
  end

  def new
    @url = Url.find_by(short_url: params[:short_url])
  end

  def create
    @url = Url.new(url_params)
    @url = @url.sanitize_and_assign_url

    if @url.save
      flash[:success] = "Shortened URL was created!"
      redirect_to(new_url_path(short_url: @url.short_url))
    else
      flash[:error] = @url.errors.full_messages
      redirect_to new_url_path
    end
  end

  def show
    @url = Url.find_by!(short_url: params[:id])
    @url.clicks += 1
    @url.save

    redirect_to @url.sanitize
  end

  def url_params
    params.require(:url).permit(:long_url, :short_url)
  end
end

class UrlsController < ApplicationController
  def index
  end

  def new
    @url = Url.new
  end

  def show
    @url = Url.find_by(short_url: params[:short_url])

    redirect_to @url.sanitize
  end
end

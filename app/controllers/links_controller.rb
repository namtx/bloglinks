class LinksController < ApplicationController
  def index
    @links = Link.includes(:provider).all
  end
end

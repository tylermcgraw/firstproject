class PagesController < ApplicationController
  def homepage
    @shoutouts = Shoutout.all
  end
end

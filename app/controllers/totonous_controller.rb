class TotonousController < ApplicationController
  def index
    @totounous = Totonous.includes(:user)
  end
end


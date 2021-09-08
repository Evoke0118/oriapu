class TotonousController < ApplicationController
  def index
    @totounous = Totonou.includes(:user)
  end

  def new
    @totonou = Totonou.new
  end
end


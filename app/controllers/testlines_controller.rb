class TestlinesController < ApplicationController
  def index
  	@testlines = Testline.all
  end

  def new
  end

  def edit
  end

  def show
  end
end

class ContestantsController < ApplicationController
  
  before_filter :authenticate , :only => :destroy
  
  def index
    @contestants = Contestant.all
  end

  def new
    @contestant = Contestant.new
  end

  def create
    @contestant = Contestant.new params[:contestant]
    if @contestant.save
      redirect_to contestants_url , :notice => 'Contestant was successfully created.'
    else
      render :action => "new"
    end
  end

  def destroy
    @contestant = Contestant.find params[:id]
    @contestant.destroy
    redirect_to contestants_url
  end
  
  def winner
    @contestant = Contestant.random
    render :show
  end
  
private

  def authenticate
    authenticate_or_request_with_http_basic do |name,password|
      name == "admin" && password == "51a687202134a82b145b639aa10337c133369033"
    end
  end
  
end

class EntriesController < ApplicationController
  unloadable
  before_filter do
    redirect_to :root unless current_user && current_user.admin?
  end
  # @example
  #   GET /entries
  #   GET /entries.xml
  #   GET /entries.json
  def index
    @entries = Entry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
      format.json  { render :json => @entries }
    end
  end

  # @example
  #   GET /entries/1
  #   GET /entries/1.xml
  #   GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
      format.json  { render :json => @entry }
    end
  end

end

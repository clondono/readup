class SummariesController < ApplicationController
  before_action :set_summary, only: [:show, :edit, :update, :destroy]
  before_action :set_reading, only: [:index, :new, :show, :destroy]
  before_action :authenticate

  # GET /reading/:reading_id/summaries
  def index
    @summaries = Summary.where(reading_id: params[:reading_id] )
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { reading :xml => @posts }
      format.json { render :json => @posts }
      format.atom
    end
  end

  # GET /summaries/1
  def show
  end

  # GET /reading/:reading_id/summaries/new
  def new
    if @can_write == false
      redirect_to root_url
      return
    end
    @summary = Summary.new
  end

  # GET /summaries/1/edit
  def edit
    if @summary.can_edit?(current_user.id) == false
      redirect_to root_url
      return
    end
  end

  # POST /summaries
  def create
    @summary = Summary.new(summary_params)
    @summary.user_id = current_user.id
    @summary.reading_id = params[:reading_id]
    respond_to do |format|
      if @summary.save
        format.html { redirect_to @summary, notice: 'summary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @summary }
      else
        format.html { render action: 'new' }
        format.json { render json: @summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /summaries/1
  def update
    respond_to do |format|
      if @summary.summary(summary)
        format.html { redirect_to @summary, notice: 'summary was successfully summary.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summaries/1
  def destroy
    @summary.destroy
    respond_to do |format|
      format.html { redirect_to reading_summaries_path(@reading) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summary
      @summary = Summary.find(params[:id])
    end

    def can_write?
      # if the current user is an owner or an collaborator of the reading, he can create new summaries
      if @reading.access_level(current_user.id) != "none" 
        @can_write = true
      else
        @can_write = false
      end
    end

    
    def set_reading
  	  if params[:reading_id]
          @reading = Reading.find(params[:reading_id])
      else
        @reading = Summary.find(params[:id]).reading
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summary_params
      params.require(:summary).permit(:title, :content, :image, :reading_id, :user_id)
    end
    
    def authenticate
    end
end


class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]
  before_action :logged_in
  before_action :prep_params, only: [:create, :update]



  # GET /readings
  # GET /readings.json
  def index
    redirect_to root_path
    @readings = Reading.all
  end

  # GET /readings/1
  # GET /readings/1.json
  def show
  end

  # GET /readings/new
  def new
    @reading = Reading.new
    @old_tags = []
  end

  # GET /readings/1/edit
  def edit
    @old_tags = @reading.tags
  end

  # POST /readings
  # POST /readings.json
  def create
    @reading = Reading.new(reading_params)
    @reading.uploader_id = @current_user.id

    respond_to do |format|
      if @reading.save
        format.html { redirect_to @reading, notice: 'Reading was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reading }
      else
        format.html { render action: 'new' }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readings/1
  # PATCH/PUT /readings/1.json
  def update
    @reading.taggables.destroy_all
    respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to @reading, notice: 'Reading was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readings/1
  # DELETE /readings/1.json
  def destroy #BigCal
    @reading.destroy
    respond_to do |format|
      format.html { redirect_to readings_url }
      format.json { head :no_content }
    end
  end

	# Never trust parameters from the scary internet, only allow the white list through.
	def reading_params
	  params[:reading].permit(:title, :file, :author, :taggables ,taggables_attributes:[:id,:tag_id],tags_attributes:[:title,:description])
	end
def logged_in
  if current_user == nil
    redirect_to new_user_session_path
  end
end

def prep_params
  tagids = []
  params[:taggables].each do |id|
    tagids.push({:tag_id => id})
  end
  params[:reading][:taggables_attributes] = tagids
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

end

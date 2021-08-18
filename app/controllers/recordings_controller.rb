class RecordingsController < ApplicationController
  def index
    @recordings = Recording.all
  end
  def show
    @recording = Recording.find(params[:id])
  end

  def new
    @recording = Recording.new
  end

  def create
    @topic = Topic.find(params[:recording][:topic_id])
    @recording = @topic.recordings.create(recording_params)
    redirect_to topic_path(@topic)
  end

  def edit
    @recording = Recording.find(params[:id])
  end

  def update
    @recording = Recording.find(params[:id])

    if @recording.update(recording_params)
      redirect_to @recording
    else
      render :edit
    end
  end

  def destroy
    @topic = Recording.find(params[:id]).topic
    @recording = @topic.recordings.find(params[:id])
    @recording.destroy
    redirect_to topic_path(@topic)
  end

  private
    def recording_params
      params.require(:recording).permit(:title, :comment, :starts_at, :ends_at)
    end

end

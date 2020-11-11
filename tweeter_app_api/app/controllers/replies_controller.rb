class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :update, :destroy]

  # Updates the index and create methods to support one - to - many  relationship 
  # GET /replies
  def index
    # @replies = Reply.all
    # Added where() for one - to - many  relationship 
    @replies = Reply.where(tweet_id: params[:tweet_id])

    render json: @replies
  end

  # GET /replies/1
  def show
    render json: @reply
  end

  # POST /replies
  def create
    @reply = Reply.new(reply_params)
    # Added for one - to - many  relationship 
    @reply.tweet_id = params[:tweet_id]
    if @reply.save
      render json: @reply, status: :created, location: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /replies/1
  def update
    if @reply.update(reply_params)
      render json: @reply
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /replies/1
  def destroy
    @reply.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reply_params
      params.require(:reply).permit(:message, :tweet_id)
    end
end

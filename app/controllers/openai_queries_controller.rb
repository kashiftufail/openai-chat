require "openai"
class OpenaiQueriesController < ApplicationController
  before_action :set_openai_query, only: %i[ show ]

  
  def index
    @openai_queries = OpenaiQuery.includes(:user)
  end

  
  def show
  end

  
  def new
    @openai_query = OpenaiQuery.new
  end

  

  
  def create
    @openai_query = OpenaiQuery.new(openai_query_params)
    get_chat_data
    respond_to do |format|
      if @openai_query.save
        format.html { redirect_to openai_query_url(@openai_query), notice: "Openai query was successfully created." }
        format.json { render :show, status: :created, location: @openai_query }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @openai_query.errors, status: :unprocessable_entity }
      end
    end
  end

  
  private
   
    def get_chat_data  
      # This is taking time it should be go as sidekiq process.
      client = OpenAI::Client.new
      response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo", 
            messages: [{ role: "user", content: "#{@openai_query.query}" }], 
            temperature: 0.7
        })
      
      @openai_query.answer = response.dig("choices", 0, "message", "content") if response.present?
      @openai_query.user = current_user
    end

    def set_openai_query
      @openai_query = OpenaiQuery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def openai_query_params
      params.require(:openai_query).permit(:query, :answer, :user_id)
    end
end

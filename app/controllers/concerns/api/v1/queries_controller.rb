class Api::V1::QueriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_query, only: :show
  # before_action :query_params, only: :create
  def index
    queries = Query.all
    render json: queries, status: 200
  end

  def show
    render json: @query, status: 200
  end

  def create
    # .to_phrase.flat_rhymes
    # @query = Query.create(query_params)
    inputArry = refine_input(params[:word_list])
    result = process_input(inputArry)
    @query = Query.create(word_list: params[:word_list], action: "rhyme_word", result: result)
    render json: @query.result, status: 200
  end

  def create_rhyme_sentence
    inputArry = params[:sentence].to_s.split(' ')
    arry = []
    inputArry.each do |word|
      word_rhymes = process_input([word])
      new_word = process_input(refine_input(word_rhymes)).to_s.gsub('[', '').to_s.gsub(']', '')
      arry.push(new_word)
    end
    result = arry.join(" ")
    @query = Query.create(word_list: params[:sentence], action: "sentence", result: result)
    render json: @query.result, status: 200
  end

  private

  def refine_input(input)
    refinedInput = input.to_s.gsub('[', '').to_s.gsub(']', '').to_s.gsub(' ', '')
    result = refinedInput.split(",")
  end

  def process_input(inputArry)
    if inputArry.length > 1
      n = rand(0...inputArry.length)
      result = "["+inputArry[n]+"]"
    else
      result = "["+inputArry[0].to_phrase.flat_rhymes.join(", ")+"]"
    end
  end


  # def query_params
  #   params.permit(:word_list)
  # end

  def set_query
    @query = Query.find(params[:id])
  end
end

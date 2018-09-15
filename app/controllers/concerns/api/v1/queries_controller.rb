class Api::V1::QueriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # returns all query objects stored in the database in JSON format
    queries = Query.all
    render json: queries, status: 200
  end

  def show
    # returns a query object in JSON format that has an id that matches params[:id]
    render json: Query.find(params[:id]), status: 200
  end

  def create
    # sends params[:word_list] to refine_input()
    # then sends the result to process_input()
    # then gets the result from that and returns it to the veiw in JSON format
    # and records a record of the request in the database
    inputArry = refine_input(params[:word_list])
    result = process_input(inputArry)
    @query = Query.create(word_list: params[:word_list], action: "rhyme_word", result: result)
    render json: @query.result, status: 200
  end

  def create_rhyme_sentence
    # finds a sentance that rhymes with the params[:sentence] sentence
    # returns the new sentence to the veiw as a string
    # and records a record of the request in the database
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
    # strip input string of any brackets or unnessary spaces
    # and the split it for any commas found
    # returns an arry with the result
    refinedInput = input.to_s.gsub('[', '').to_s.gsub(']', '').to_s.gsub(' ', '')
    result = refinedInput.split(",")
  end

  def process_input(inputArry)
    # if inputArray is more then one element
    # return a stringified array that contains only one random element from the input array
    # else if inputArray is only one element
    # return an stringified array of words that rhyme with that element
    if inputArry.length > 1
      n = rand(0...inputArry.length)
      result = "["+inputArry[n]+"]"
    else
      result = "["+inputArry[0].to_phrase.flat_rhymes.join(", ")+"]"
    end
  end

end

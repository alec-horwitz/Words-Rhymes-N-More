class Api::V1::QueriesController < ApplicationController
  before_action :set_query, only: :show
  before_action :query_params, only: :create
  def index
    queries = Query.all
    render json: queries, status: 200
  end

  def show
    render json: @query, status: 200
  end

  def create
    @query = Query.create(word_list: params[:word_list])
    render json: @query, status: 200
  end

  private

  def query_params
    params.permit(:word_list)
  end

  def set_query
    @query = Query.find(params[:id])
  end
end

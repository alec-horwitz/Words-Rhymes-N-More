require 'test_helper'

RSpec.describe "Widget management", :type => :request do

  it "creates a Widget and redirects to the Widget's page" do
    post "/queries", :query => {word_list: "[apple, cake, popcorn]"}
    expect(response.body).to include("apple").or(include("cake")).or(include("popcorn"))
  end

  it "creates a Widget and redirects to the Widget's page" do
    post "/queries", :query => {word_list: "[cake]"}
    expect(response.body).to include("[take, wake, rake, fake]")
  end
end

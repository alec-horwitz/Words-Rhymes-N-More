require 'rails_helper'

RSpec.describe "word and rhyme requests", :type => :request do

  it "When \"create\" is given a stringified list of words, it returns stringified list containing a single word from the original list." do
    post "/api/v1/queries", params: {word_list: "[apple, cake, popcorn]"}
    expect(response.body).to eq("[apple]").or(eq("[cake]")).or(eq("[popcorn]"))
  end


  it "When \"create\" is given a stringified list of words, it returns stringified list containing a single word from the original list. Then \"index\" will show a record of this from the database" do
    post "/api/v1/queries", params: {word_list: "[apple, cake, popcorn]"}
    get "/api/v1/queries"
    # puts response.body
    expect(response.body).to include('"word_list":"[apple, cake, popcorn]","action":"rhyme_word"')
  end

  it "When \"create\" is given a stringified list of words, it returns stringified list containing a single word from the original list. Then \"show\" will show a record of this from the database" do
    post "/api/v1/queries", params: {word_list: "[apple, cake, popcorn]"}
    get "/api/v1/queries/1"
    # puts response.body
    expect(response.body).to include('"word_list":"[apple, cake, popcorn]","action":"rhyme_word"')
  end


  it "When \"create\" is given a stringified list containing a single word it returns all the words that rhyme with it" do
    post "/api/v1/queries", params: {word_list: "[cake]"}
    expect(response.body).to eq("[ache, ake, awake, bake, blake, brake, break, dake, drake, fake, flake, forsake, haik, hake, jacque, jake, lake, make, mistake, naik, opaque, paik, pake, partake, plake, quake, rake, remake, retake, sake, schake, schlake, schnake, schwake, shaik, shaikh, shake, shrake, snake, spake, stake, steak, take, wake, yake]")
  end

  it "\"create_rhyme_sentence\" makes a new sentence that rhymes with the one it is given" do
    test_sentence = "I love code"
    post "/api/v1/queries/sentence", params: {sentence: test_sentence}
    response_body_arry = response.body.split(" ")
    test_arry = test_sentence.split(" ")
    for i in 0...response_body_arry.length
      expect(test_arry[i].to_phrase.flat_rhymes).to include(response_body_arry[i])
    end
  end

end

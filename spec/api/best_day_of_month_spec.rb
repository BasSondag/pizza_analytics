require 'spec_helper'

describe Base::API do
  include Rack::Test::Methods

  def app
    Base::API
  end

  it 'best_day_of_month' do
    get '/api/best_day_of_month'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq([{"day_total":2,"date":"2015-01-01"},{"day_total":1,"date":"2015-01-02"},{"day_total":1,"date":"2015-01-03"},{"day_total":2,"date":"2015-01-06"},{"day_total":3,"date":"2015-01-07"},{"day_total":1,"date":"2015-01-08"},{"day_total":1,"date":"2015-01-09"},{"day_total":1,"date":"2015-01-10"},{"day_total":1,"date":"2015-01-11"},{"day_total":1,"date":"2015-01-12"},{"day_total":1,"date":"2015-01-13"},{"day_total":1,"date":"2015-01-15"},{"day_total":1,"date":"2015-01-17"},{"day_total":1,"date":"2015-02-01"},{"day_total":2,"date":"2015-03-01"},{"day_total":1,"date":"2015-04-01"},{"day_total":3,"date":"2015-05-01"},{"day_total":1,"date":"2015-08-01"}].to_json)
  end
end

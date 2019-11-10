require 'spec_helper'

describe 'Pizza Analytics', js: true, type: :feature do

  context 'curl' do
    it 'checks for json' do
      visit '/'
      url = "http://#{Capybara.server_host}:#{Capybara.server_port}/api/best_day_of_month"
      json = '{"reticulated":"false"}'
      rc = `curl -X POST -d '#{json}' #{url} -H 'Accept: application/json' -H 'Content-Type:application/json' -s`
      expect(rc).to eq(json)
    end
  end
end

require 'date'

module Base
  class Streaks < Grape::API
    format :json
    resource :streaks do
      desc "return all pizza_consumptions"
      get "/", root: :streaks do
        pizza_consumptions = DB["SELECT COUNT(1) AS day_total, DATE(eaten_at) as date FROM pizzas GROUP BY DATE(eaten_at) ORDER BY DATE(eaten_at) ASC;"]
        pizza_consumptions.all
        temp = 0
        streak = Array.new
        streaks = Array.new
        pizza_consumptions.each do |value|
          if temp < value[:day_total]
            hash = Hash.new
            hash[:date] = value[:date]
            hash[:day_total] = value[:day_total]
            streak << hash
            temp = value[:day_total]
          elsif streak.length > 1
            streaks << streak
            streak = Array.new
            hash = Hash.new
            hash[:date] = value[:date]
            hash[:day_total] = value[:day_total]
            streak << hash
            temp = value[:day_total]
          else
            streak = Array.new
            hash = Hash.new
            hash[:date] = value[:date]
            hash[:day_total] = value[:day_total]
            streak << hash
            temp = value[:day_total]
          end
        end
        if streak.length > 1
          streaks << streak
        end
        streaks
      end
    end
  end
end

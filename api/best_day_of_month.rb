require 'date'

module Base
  class Best_day_of_month < Grape::API
    format :json
    resource :best_day_of_month do
      desc "return all pizza_consumptions"
      get "/", root: :best_day_of_month do
        pizza_consumptions = DB["SELECT COUNT(1) AS day_total, DATE(eaten_at) as date FROM pizzas GROUP BY DATE(eaten_at) ORDER BY DATE(eaten_at) ASC;"]
        pizza_consumptions.all
        max = 0
        temp_month = ''
        best_day = ''
        month = ''
        months = Array.new
        pizza_consumptions.each do |value|
          month = value[:date]
          day = value[:date]
          if temp_month.to_s.strip.empty?
            temp_month = month.strftime("%m/%Y")
            max = value[:day_total]
            best_day = day
          elsif temp_month == month.strftime("%m/%Y") && value[:day_total] > max
            max = value[:day_total]
            best_day = day
          elsif temp_month != month.strftime("%m/%Y")
            hash = Hash.new
            hash[:month] = temp_month
            hash[:max] = max
            hash[:best_day] = best_day
            months << hash
            temp_month = month.strftime("%m/%Y")
            max = value[:day_total]
            best_day = day
          end
        end
        if months[-1][:best_day].strftime("%m/%Y") != temp_month
          hash = Hash.new
          hash[:month] = temp_month
          hash[:max] = max
          hash[:best_day] = best_day
          months << hash
        elsif months[-1][:day_total] < max
          months[-1][:day_total] = max
          months[-1][:best_day] = best_day
        end
        months
      end
    end
  end
end

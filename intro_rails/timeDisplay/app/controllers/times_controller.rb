class TimesController < ApplicationController
    def index
        time1 = Time.now
        @time = time1.inspect
        @year = time1.year
        @month = time1.month
        @day = time1.day
        @hour = time1.hour
        @min = time1.min
        @sec = time1.sec
    end
end

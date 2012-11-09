class CacheStatisticsController < ApplicationController

  def total_stats

    CacheStatistic.create_from_file
    @stats = CacheStatistic.all
    render 'statistics/total'

  end

  def field_stats
    @stats = CacheStatistic.extract_sorted_stats(params[:fields])

    if @stats == []
      flash[:notice] = "You didn't specify any fields"
      redirect_to '/' and return
    end

    render 'statistics/fields'
  end

end

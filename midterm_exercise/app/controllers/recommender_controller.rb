class RecommenderController < ApplicationController
  def index
  end

  def recommend_me
    # binding.pry
    body_part = params[:body_part]
    @time = params['time']
    svc = RecommenderService.new(@time, body_part)
    @recommendations = svc.recommend_me
    @times_reps = svc.times_reps
    @work_time = @times_reps[0]
    @break_time = @times_reps[1]
    @mega_set = @times_reps[2]
    @set = @times_reps[3]
    quotes = Quote.all
    @quote = quotes.shuffle.first
    @instructions = self.megaset(@mega_set)

  end

  def descriptions
    binding.pry
    @descriptions = description.new(params[:description])
    # @descriptions = @recommendations.map do |exercise|
    #                   exercise.description
    #                 end
  end

  def megaset(mega_set)
    if mega_set.to_i <= 4
      if mega_set == 1
        return self.megaset1(@time, @set, @work_time, @break_time, @recommendations)
      elsif mega_set == 2
        self.megaset2(@time, @set, @work_time, @break_time, @recommendations)
      elsif mega_set == 3
        self.megaset3(@time, @set, @work_time, @break_time, @recommendations)
      else
        self.megaset4(@time, @set, @work_time, @break_time, @recommendations)
      end
    end
  end

  def megaset1(time, set, work_time, break_time, recommendations)
      @workout = ["Do this set " + set.to_s + " times:",
      @recommendations.map do |exercise|
        exercise.name.capitalize + " for " + @work_time.to_s + " seconds"
      end,
      "Break for " + @break_time.to_s + " seconds"]
  end

  def megaset2(time, set, work_time, break_time, recommendations)
      @workout = ["Do this set " + set.to_s + " times:",
      @recommendations[0].map do |exercise|
        exercise.name.capitalize + " for " + @work_time.to_s + " seconds"
      end,
      "Break for " + @break_time.to_s + " seconds <br>",
      "Do this set " + set.to_s + " times:",
      @recommendations[1].map do |exercise|
        exercise.name.capitalize + " for " + @work_time.to_s + " seconds"
      end,
      "Break for " + @break_time.to_s + " seconds"]
  end

  def megaset3(time, set, work_time, break_time, recommendations)
    @workout = ["Do this set " + set.to_s + " times:",
    @recommendations[0].map do |exercise|
      exercise.name.capitalize + " for " + @work_time.to_s + " seconds"
    end,
    "Break for " + @break_time.to_s + " seconds <br>",
    "Do this set " + set.to_s + " times:",
    @recommendations[1].map do |exercise|
      exercise.name.capitalize + " for " + @work_time.to_s + " seconds"
    end,
    "Break for " + @break_time.to_s + " seconds <br>",
    "Do this set " + set.to_s + " times:",
    @recommendations[2].map do |exercise|
      exercise.name.capitalize + " for " + @work_time.to_s + " seconds"
    end,
    "Break for " + @break_time.to_s + " seconds"]
  end

  def megaset4(time, set, work_time, break_time, recommendations)
    @workout = ["Do this set " + set.to_s + " times:",
    @recommendations[0].map do |exercise|
      exercise.name.capitalize + " for " + @work_time.to_s + " seconds"
    end,
    "Break for " + @break_time.to_s + " seconds <br>",
    "Do this set " + set.to_s + " times:",
    @recommendations[1].map do |exercise|
      exercise.name.capitalize + " for " + @work_time.to_s + " seconds"
    end,
    "Break for " + @break_time.to_s + " seconds <br>",
    "Do this set " + set.to_s + " times:",
    @recommendations[0].map do |exercise|
      exercise.name.capitalize + " for " + @work_time.to_s + " seconds"
    end,
    "Break for " + @break_time.to_s + " seconds <br>",
    "Do this set " + set.to_s + " times:",
    @recommendations[1].map do |exercise|
      exercise.name.capitalize + " for " + @work_time.to_s + " seconds"
    end,
    "Break for " + @break_time.to_s + " seconds"]
  end
end

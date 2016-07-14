class RecommenderService
  attr_accessor :time, :body_part

  def initialize(time, body_part)
    @time = time.to_i
    @body_part = body_part
  end

  def recommend_me
    if @time == 10
      exercise_ids = Tag.where(body_part: @body_part).pluck(:exercise_id).uniq
      exercise_options = Exercise.where(id: exercise_ids)
      exercise_options.shuffle.first(3)
    elsif @time == 15
      exercise_ids = Tag.where(body_part: @body_part).pluck(:exercise_id).uniq
      exercise_options = Exercise.where(id: exercise_ids)
      exercise_options.shuffle.first(4)
    elsif @time == 20
      exercise_ids = Tag.where(body_part: @body_part).pluck(:exercise_id).uniq
      exercise_options = Exercise.where(id: exercise_ids)
      [exercise_options.shuffle.first(3), exercise_options.shuffle.first(3)]
    elsif @time == 30
      exercise_ids = Tag.where(body_part: @body_part).pluck(:exercise_id).uniq
      exercise_options = Exercise.where(id: exercise_ids)
      [exercise_options.shuffle.first(4), exercise_options.shuffle.first(4)]
    elsif @time == 40
      exercise_ids = Tag.where(body_part: @body_part).pluck(:exercise_id).uniq
      exercise_options = Exercise.where(id: exercise_ids)
      [exercise_options.shuffle.first(3), exercise_options.shuffle.first(3)]
    elsif @time == 50
      exercise_ids = Tag.where(body_part: @body_part).pluck(:exercise_id).uniq
      exercise_options = Exercise.where(id: exercise_ids)
      [exercise_options.shuffle.first(4),exercise_options.shuffle.first(4), exercise_options.shuffle.first(4)]
    elsif @time == 60
      exercise_ids = Tag.where(body_part: @body_part).pluck(:exercise_id).uniq
      exercise_options = Exercise.where(id: exercise_ids)
      [exercise_options.shuffle.first(4),exercise_options.shuffle.first(4)]

    end
  end

  def times_reps
    if @time == 10
      @work_time = 60
      @break_time = 30
      @mega_set = 1
      @set = 3
      @times_reps = [@work_time, @break_time, @mega_set, @set]
      return @times_reps
    elsif @time == 15
      @work_time = 50
      @break_time = 35
      @mega_set = 1
      @set = 4
      @times_reps = [@work_time, @break_time, @mega_set, @set]
      return @times_reps
    elsif @time == 20
      @work_time = 60
      @break_time = 30
      @mega_set = 2
      @set = 3
      @times_reps = [@work_time, @break_time, @mega_set, @set]
      return @times_reps
    elsif @time == 30
      @work_time = 50
      @break_time = 35
      @mega_set = 2
      @set = 4
      @times_reps = [@work_time, @break_time, @mega_set, @set]
      return @times_reps
    elsif @time == 40
      @work_time = 55
      @break_time = 40
      @mega_set = 4
      @set = 3
      @times_reps = [@work_time, @break_time, @mega_set, @set]
      return @times_reps
    elsif @time == 50
      @work_time = 45
      @break_time = 30
      @mega_set = 3
      @set = 4
      @times_reps = [@work_time, @break_time, @mega_set, @set]
      return @times_reps
    elsif @time == 60
      @work_time = 50
      @break_time = 35
      @mega_set = 4
      @set = 4
      @times_reps = [@work_time, @break_time, @mega_set, @set]
      return @times_reps
    end
  end
end

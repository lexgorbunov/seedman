module Seedman
  require 'ruby-progressbar'
  class Base
    attr_reader :title, :total_count, :store

    def initialize(title: 'Выполнение... ', format: '%t [%c/%C] |%b>%i %p%% %e')
      @total_count = 0
      @procs = []
      @progress = nil
      @title = title
      @format = format
      @store = OpenStruct.new
    end

    def add(title, steps_count, &block)
      @total_count += steps_count
      @procs << [title, steps_count, block]
    end

    def process
      @progress.stop if @progress.present? and not @progress.stopped?
      @progress = ProgressBar.create(
        title: title,
        total: total_count,
        format: @format,
        progress_mark:  '=',
        remainder_mark: ' ',
        starting_at: 0,
      )
      @procs.each do |proc_params|
        title, steps_count, block = proc_params
        @progress.log(title)
        block.call(steps_count, self)
      end

      nil
    end

    def inc
      @progress.increment
    end
  end
end

class Bike
    def working?
      @broken ? (false):(true) # I see what you're going for here but it feels a bit complicated.
      # These two methods are doing quite similar things. Is the working? method necessary if you already have the broken flag?
    end

    def report_broken
      @broken = true
    end

end

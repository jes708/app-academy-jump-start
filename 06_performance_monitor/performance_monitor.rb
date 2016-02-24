def measure(repeats = 1)  

  start = Time.now
  repeats.times {yield}
  (Time.now - start) / repeats

end  
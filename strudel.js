setcpm(138/4)

stack(
  s("bd*4").gain(0.8),
  note("a2*8").sound("sawtooth").lpf(600).gain(0.5),
  s("hh*16").gain(0.3),
  s("~ cp ~ cp").gain(0.5),
   note("a4 c5 d5 e5 g5 e5 d5 c5".slow(2))
    .sound("sawtooth")
    .lpf(3000)
    .room(0.8)
    .delay(0.5)
    .gain(0.5)
    .release(0.4)
)

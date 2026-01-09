use_bpm 90
use_debug false
in_thread do
  sleep 165
  
  live_loop(:pad_halo) {stop }
  live_loop(:beat) { stop }
  live_loop(:sub) { stop }
  live_loop(:melody) { stop }
  live_loop(:noise_fog) { stop }
  live_loop(:variation) { stop }

with_fx :reverb, room: 1, mix: 0.8 do
    use_synth :dark_ambience
    play chord(:e3, :minor7), amp: 0.3, sustain: 6, release: 8
    sleep 4
    play chord(:c3, :minor7), amp: 0.25, sustain: 6, release: 8
    sleep 4
    play chord(:a2, :minor7), amp: 0.2, sustain: 6, release: 8
    sleep 8
  end
end
chords = [
  chord(:e3, :minor),
  chord(:g3, :major),
  chord(:d3, :major),
  chord(:b2, :minor)
]
live_loop :beat do
  with_fx :compressor, mix: 0.4 do
    sample :loop_amen, beat_stretch: 2, amp: 0.45
    sleep 2
  end
  if one_in(4)
    sample :loop_breakbeat, beat_stretch: 2, amp: 0.35, start: 0.25
  end
end
live_loop :sub, sync: :beat do
  use_synth :fm
  note = (ring :e2, :g2, :d2, :b1).tick
  play note, amp: 0.35, sustain: 1.5, release: 0.5, divisor: 2
  sleep 2
end
live_loop :melody, sync: :beat do
  use_synth :hollow
  with_fx :echo, phase: 0.75, mix: 0.45 do
    notes = (scale :e4, :minor_pentatonic)
    play notes.choose, amp: 0.12, sustain: 2, release: 2, pan: rrand(-0.5, 0.5)
  end
  sleep [1, 2, 3].choose
end
live_loop :noise_fog, sync: :beat do
  with_fx :hpf, cutoff: 110 do
    with_fx :reverb, room: 1, mix: 0.7 do
      synth :noise, amp: 0.025, sustain: 4, release: 1
    end
  end
  sleep 4
end
live_loop :variation, sync: :beat do
  sleep 16
  with_fx :reverb, room: 1, mix: 0.8 do
    use_synth :blade
    play chord(:e4, :minor), sustain: 4, release: 4, amp: 0.25
  end
  sleep 8
end

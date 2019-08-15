struct instruments {    let `graphstate`: 
    let `instruments`: [instruments]
    let `message`: 
    let `name`: String
    let `orderlist`: 
    let `patterns`: [patterns]
    let `pluginstate`: 
    let `samples`: [samples]
    let `version`: Int
}

struct samples {    let `c5_samplerate`: Int
    let `global_volume`: Int
    let `legacy_filename`: String
    let `length`: Int
    let `loop_end`: Int
    let `loop_start`: Int
    let `name`: String
    let `pan`: Int
    let `sustain_end`: Int
    let `sustain_start`: Int
    let `vibrato_depth`: Int
    let `vibrato_rate`: Int
    let `vibrato_sweep`: Int
    let `vibrato_type`: Int
    let `volume`: Int
}

struct patterns {    let `data`: 
    let `name`: String
    let `rows`: Int
    let `rows_per_beat`: Int
    let `rows_per_measure`: Int
}

struct instruments {    let `default_filter_cutoff`: Int
    let `default_filter_cutoff_enabled`: Bool
    let `default_filter_mode`: Int
    let `default_filter_resonance`: Int
    let `default_filter_resonance_enabled`: Bool
    let `default_pan`: Int
    let `duplicate_check_type`: Int
    let `duplicate_note_action`: Int
    let `fadeout`: Int
    let `global_volume`: Int
    let `graph_insert`: Int
    let `legacy_filename`: String
    let `midi_bank`: Int
    let `midi_channel`: Int
    let `midi_drum_set`: Int
    let `midi_program`: Int
    let `name`: String
    let `new_note_action`: Int
    let `note_map`: 
    let `panning_envelope`: panning_envelope
    let `pitch_envelope`: pitch_envelope
    let `pitch_pan_center`: Int
    let `pitch_pan_separation`: Int
    let `pitch_to_tempo_lock`: Int
    let `random_cutoff_weight`: Int
    let `random_pan_weight`: Int
    let `random_resonance_weight`: Int
    let `random_volume_weight`: Int
    let `sample_map`: 
    let `tuning`: 
    let `volume_envelope`: volume_envelope
    let `volume_ramp_down`: Int
    let `volume_ramp_up`: Int
}

struct volume_envelope {    let `loop_end`: Int
    let `loop_start`: Int
    let `nodes`: [nodes]
    let `release_node`: Int
    let `sustain_end`: Int
    let `sustain_start`: Int
}

struct nodes {    let `tick`: Int
    let `value`: Int
}

struct pitch_envelope {    let `loop_end`: Int
    let `loop_start`: Int
    let `nodes`: [nodes]
    let `release_node`: Int
    let `sustain_end`: Int
    let `sustain_start`: Int
}

struct nodes {    let `tick`: Int
    let `value`: Int
}

struct panning_envelope {    let `loop_end`: Int
    let `loop_start`: Int
    let `nodes`: [nodes]
    let `release_node`: Int
    let `sustain_end`: Int
    let `sustain_start`: Int
}

struct nodes {    let `tick`: Int
    let `value`: Int
}


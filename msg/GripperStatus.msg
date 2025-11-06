bool is_initialized
uint8 state
float32 position
uint16 force

# state: {  0: in motion, 1: Position reached, 2: Object clamped, 3: Object dropped}
# position: [0, 95.0]
# force: [20, 100]
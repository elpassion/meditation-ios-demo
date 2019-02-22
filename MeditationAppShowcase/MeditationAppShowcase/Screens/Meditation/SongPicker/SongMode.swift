enum Picking: Equatable {
    case selected, unselected
}

enum Listening: Equatable {
    case playable, playing, hidden
}

enum SongMode: Equatable {
    case picking(Picking)
    case listening(Listening)
}

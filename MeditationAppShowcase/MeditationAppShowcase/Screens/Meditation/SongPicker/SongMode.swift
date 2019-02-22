enum Picking {
    case selected, unselected
}

enum Listening {
    case playable, playing, hidden
}

enum SongMode {
    case picking(Picking)
    case listening(Listening)
}

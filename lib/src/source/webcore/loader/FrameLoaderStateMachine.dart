enum State { CreatingInitialEmptyDocument, DisplayingInitialEmptyDocument, DisplayingInitialEmptyDocumentPostCommit, FirstLayoutDone }

abstract class _FrameLoaderStateMachine {
  bool get committingFirstRealLoad;

  bool get committedFirstRealDocumentLoad;

  bool get creatingInitialEmptyDocument;

  bool get isDisplayingInitialEmptyDocument;

  bool get firstLayoutDone;

  void advanceTo(State state);

  State get stateForDebugging;
}

class FrameLoaderStateMachine implements _FrameLoaderStateMachine {
  State _state;

  @override
  void advanceTo(State state) {
    _state = state;
  }

  @override
  bool get committedFirstRealDocumentLoad {
    return _state.index >= State.DisplayingInitialEmptyDocumentPostCommit.index;
  }

  @override
  bool get committingFirstRealLoad {
    return _state == State.DisplayingInitialEmptyDocument;
  }

  @override
  bool get creatingInitialEmptyDocument {
    return _state == State.CreatingInitialEmptyDocument;
  }

  @override
  bool get firstLayoutDone {
    return _state == State.FirstLayoutDone;
  }

  @override
  bool get isDisplayingInitialEmptyDocument {
    return _state == State.DisplayingInitialEmptyDocument || _state == State.DisplayingInitialEmptyDocumentPostCommit;
  }

  @override
  State get stateForDebugging {
    return _state;
  }
}

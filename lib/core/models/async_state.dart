class AsyncState<T>{
  final T data;

  AsyncState(this.data);
}

class Initial<T> extends AsyncState<T>{
  Initial(T data) : super(data);
}

class Loading<T> extends AsyncState<T>{
  Loading(T data) : super(data);
}

class Success<T> extends AsyncState<T>{
  Success(T data) : super(data);
}
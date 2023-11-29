class URLS {
  static const String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoidmlrYXMiLCJwaG9uZV9udW1iZXIiOiIrOTE3MDA0MTc3NTY4IiwidXNlcklkIjoiNjU0Y2RlYjBkOGFmYjgwYmM5Y2I2ZjA1Iiwicm9sZSI6InVzZXIiLCJwcm9maWxlX3BpY3R1cmUiOm51bGwsImxvY2F0aW9uIjp7fSwicHJvZmlsZV9jb21wbGV0ZWQiOnRydWUsImlhdCI6MTcwMDk4NTIyMywiZXhwIjoxNzAzNTc3MjIzfQ.bsOiszxuUtJZnqnQ9iq7oGeo_9UC7OwJKHLaUMc3ojs';
  //  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiTW9oYW1tYWQiLCJwaG9uZV9udW1iZXIiOiIrOTE3MDA0MTc3NTY4IiwidXNlcklkIjoiNjU0Y2RlYjBkOGFmYjgwYmM5Y2I2ZjA1Iiwicm9sZSI6InVzZXIiLCJwcm9maWxlX3BpY3R1cmUiOm51bGwsImxvY2F0aW9uIjp7fSwicHJvZmlsZV9jb21wbGV0ZWQiOnRydWUsImlhdCI6MTY5OTYzNjg4MCwiZXhwIjoxNzAyMjI4ODgwfQ.O6WytC9-cyGhXgncnHGVP8RpCSoTXzYkDRsjPLdTONw';

  // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZV9udW1iZXIiOiIrOTE3MDA0MTc3NTY4IiwidXNlcklkIjoiNjU0Y2RlYjBkOGFmYjgwYmM5Y2I2ZjA1Iiwicm9sZSI6InVzZXIiLCJwcm9maWxlX3BpY3R1cmUiOm51bGwsImxvY2F0aW9uIjp7fSwiaWF0IjoxNjk5NTM2NjA5LCJleHAiOjE2OTk2MjMwMDl9.NWx_wj6MipBGqVGW28fCpp4Hi92L-cd1emRDuEZiWUA';
  static const String baseURL = 'https://trills.onrender.com/api/v1/Trills/';

  static const String validateOTP = baseURL + 'validateOTP';
  static const String generateOTP = baseURL + 'generateOTP/';
  static const String registerUser = baseURL + 'register';

  static const String updateUserData = baseURL + 'CurrentUser';
  static const String getUserData = baseURL + 'CurrentUser';
  static const String getAllPosts = baseURL + 'posts';
  static const String sendUserRequest = baseURL + 'request';
  static const String getIncomingRequests = baseURL + 'request/incoming';
  static const String likePost = baseURL + 'post/like/';
  static const String addPost = baseURL + 'post';

  static const String getChatMessages = baseURL + '/chat/messages/';

  

}

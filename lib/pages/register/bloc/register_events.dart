abstract class RegisterEvents {
  const RegisterEvents();
}

class UsernameEvents extends RegisterEvents {
  final String username;

  const UsernameEvents(this.username);
}

class EmailEvents extends RegisterEvents {
  final String email;

  const EmailEvents(this.email);
}

class PasswordEvents extends RegisterEvents {
  final String password;

  const PasswordEvents(this.password);
}

class RePasswordEvents extends RegisterEvents {
  final String rePassword;

  const RePasswordEvents(this.rePassword);
}

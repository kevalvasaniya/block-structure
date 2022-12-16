
/// enum variable to static value store.
enum Roles { notVerifiedProvider, provider, notVerifiedConsumer, consumer }

extension RolesExtension on Roles {
  static const values = {
    Roles.notVerifiedProvider: "NOT_VERIFIED_PROVIDER",
    Roles.provider: "PROVIDER",
    Roles.notVerifiedConsumer: "NOT_VERIFIED_CONSUMER",
    Roles.consumer: "CONSUMER"
  };
  String? get value => values[this];
}

enum LoginFlowState {
  loginSuccessNotVerifiedUserRole,
  loginSuccessNotVerifiedAccount,
  loginSuccessNoUser,
  fromDeepLinkForVerifiedConsumer,
  fromDeepLinkForNOTVerifiedConsumer
}

// NOTE: This file was generated by the ServiceGenerator.

// ----------------------------------------------------------------------------
// API:
//   Cloud OS Login API (oslogin/v1)
// Description:
//   Manages OS login configuration for Google account users.
// Documentation:
//   https://cloud.google.com/compute/docs/oslogin/rest/

#import "GTLRCloudOSLoginObjects.h"

// ----------------------------------------------------------------------------
//
//   GTLRCloudOSLogin_Empty
//

@implementation GTLRCloudOSLogin_Empty
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudOSLogin_ImportSshPublicKeyResponse
//

@implementation GTLRCloudOSLogin_ImportSshPublicKeyResponse
@dynamic loginProfile;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudOSLogin_LoginProfile
//

@implementation GTLRCloudOSLogin_LoginProfile
@dynamic name, posixAccounts, sshPublicKeys;

+ (NSDictionary<NSString *, Class> *)arrayPropertyToClassMap {
  NSDictionary<NSString *, Class> *map = @{
    @"posixAccounts" : [GTLRCloudOSLogin_PosixAccount class]
  };
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudOSLogin_LoginProfile_SshPublicKeys
//

@implementation GTLRCloudOSLogin_LoginProfile_SshPublicKeys

+ (Class)classForAdditionalProperties {
  return [GTLRCloudOSLogin_SshPublicKey class];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudOSLogin_PosixAccount
//

@implementation GTLRCloudOSLogin_PosixAccount
@dynamic accountId, gecos, gid, homeDirectory, primary, shell, systemId, uid,
         username;
@end


// ----------------------------------------------------------------------------
//
//   GTLRCloudOSLogin_SshPublicKey
//

@implementation GTLRCloudOSLogin_SshPublicKey
@dynamic expirationTimeUsec, fingerprint, key;
@end

///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///
/// Auto-generated by Stone, do not modify.
///

#import "DBSHARINGAccessLevel.h"
#import "DBSHARINGAddFileMemberArgs.h"
#import "DBSHARINGMemberSelector.h"
#import "DBStoneSerializers.h"
#import "DBStoneValidators.h"

#pragma mark - API Object

@implementation DBSHARINGAddFileMemberArgs

#pragma mark - Constructors

- (instancetype)initWithFile:(NSString *)file
                     members:(NSArray<DBSHARINGMemberSelector *> *)members
               customMessage:(NSString *)customMessage
                       quiet:(NSNumber *)quiet
                 accessLevel:(DBSHARINGAccessLevel *)accessLevel
         addMessageAsComment:(NSNumber *)addMessageAsComment {
  [DBStoneValidators stringValidator:@(1) maxLength:nil pattern:@"((/|id:).*|nspath:[^:]*:[^:]*)"](file);
  [DBStoneValidators arrayValidator:nil maxItems:nil itemValidator:nil](members);

  self = [super init];
  if (self) {
    _file = file;
    _members = members;
    _customMessage = customMessage;
    _quiet = quiet ?: @NO;
    _accessLevel = accessLevel ?: [[DBSHARINGAccessLevel alloc] initWithViewer];
    _addMessageAsComment = addMessageAsComment ?: @NO;
  }
  return self;
}

- (instancetype)initWithFile:(NSString *)file members:(NSArray<DBSHARINGMemberSelector *> *)members {
  return [self initWithFile:file members:members customMessage:nil quiet:nil accessLevel:nil addMessageAsComment:nil];
}

#pragma mark - Serialization methods

+ (NSDictionary *)serialize:(id)instance {
  return [DBSHARINGAddFileMemberArgsSerializer serialize:instance];
}

+ (id)deserialize:(NSDictionary *)dict {
  return [DBSHARINGAddFileMemberArgsSerializer deserialize:dict];
}

#pragma mark - Description method

- (NSString *)description {
  return [[DBSHARINGAddFileMemberArgsSerializer serialize:self] description];
}

@end

#pragma mark - Serializer Object

@implementation DBSHARINGAddFileMemberArgsSerializer

+ (NSDictionary *)serialize:(DBSHARINGAddFileMemberArgs *)valueObj {
  NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];

  jsonDict[@"file"] = valueObj.file;
  jsonDict[@"members"] = [DBArraySerializer serialize:valueObj.members
                                            withBlock:^id(id elem) {
                                              return [DBSHARINGMemberSelectorSerializer serialize:elem];
                                            }];
  if (valueObj.customMessage) {
    jsonDict[@"custom_message"] = valueObj.customMessage;
  }
  jsonDict[@"quiet"] = valueObj.quiet;
  jsonDict[@"access_level"] = [DBSHARINGAccessLevelSerializer serialize:valueObj.accessLevel];
  jsonDict[@"add_message_as_comment"] = valueObj.addMessageAsComment;

  return jsonDict;
}

+ (DBSHARINGAddFileMemberArgs *)deserialize:(NSDictionary *)valueDict {
  NSString *file = valueDict[@"file"];
  NSArray<DBSHARINGMemberSelector *> *members =
      [DBArraySerializer deserialize:valueDict[@"members"]
                           withBlock:^id(id elem) {
                             return [DBSHARINGMemberSelectorSerializer deserialize:elem];
                           }];
  NSString *customMessage = valueDict[@"custom_message"] ?: nil;
  NSNumber *quiet = valueDict[@"quiet"] ?: @NO;
  DBSHARINGAccessLevel *accessLevel = valueDict[@"access_level"]
                                          ? [DBSHARINGAccessLevelSerializer deserialize:valueDict[@"access_level"]]
                                          : [[DBSHARINGAccessLevel alloc] initWithViewer];
  NSNumber *addMessageAsComment = valueDict[@"add_message_as_comment"] ?: @NO;

  return [[DBSHARINGAddFileMemberArgs alloc] initWithFile:file
                                                  members:members
                                            customMessage:customMessage
                                                    quiet:quiet
                                              accessLevel:accessLevel
                                      addMessageAsComment:addMessageAsComment];
}

@end

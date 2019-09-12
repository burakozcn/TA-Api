#import "NetworkManagement.h"

@implementation NetworkManagement

NSError *error = nil;

+ (void) postResults {
  NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
  NSURLSession *session = [NSURLSession sessionWithConfiguration:conf];
  NSURL *url = [NSURL URLWithString:@"https://api.turkishairlines.com/test/getTimeTable"];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
  
  [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [request addValue:@"bc584a158d70425ebc76480647dd1084" forHTTPHeaderField:@"apisecret"];
  [request addValue:@"l7xx5d845144e71746bfa6e34f6ca7bc7bb5" forHTTPHeaderField:@"apikey"];
  [request setHTTPMethod:@"POST"];
  
  NSDictionary *dict = [Helper getDict];
  
  NSData *postData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:NULL];
  [request setHTTPBody:postData];
  
  NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    
    NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *array = [Helper resolveDict:responseDict];
    
  }];
  
  [dataTask resume];
}

@end

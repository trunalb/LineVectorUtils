#import <Foundation/Foundation.h>

@interface LineVectorUtils : NSObject
+(CGPoint)getPointlongLineFromPointA:(CGPoint)pointA pointB:(CGPoint)pointB atDistance:(CGFloat)distance fromPoint:(CGPoint)pointC;

+(CGPoint)getUnitVectorAlongLineForPointA:(CGPoint)pointA pointB:(CGPoint)pointB;

+(NSMutableArray *)getEquidistantPointsAtDistance:(CGFloat)distance onALineFromPointA:(CGPoint)pointA toPointB:(CGPoint)pointB;

+(CGFloat)getLengthOfLineFromPointA:(CGPoint)pointA toPointB:(CGPoint)pointB;

+(NSArray *)getTwoEquidistantPointsOnALineWithSlope:(CGFloat)slope aPointOnTheLine:(CGPoint)point atDistance:(CGFloat)distance fromPoint:(CGPoint)anotherPoint;

+(double)calculateSlopeForPointA:(CGPoint)pointA pointB:(CGPoint)pointB;
@end

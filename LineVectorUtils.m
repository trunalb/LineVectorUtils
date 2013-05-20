#import "LineVectorUtils.h"

@implementation LineVectorUtils
+(NSMutableArray *)getEquidistantPointsAtDistance:(CGFloat)distance onALineFromPointA:(CGPoint)pointA toPointB:(CGPoint)pointB{
  CGFloat lineLength = [LineVectorUtils getLengthOfLineFromPointA:pointA toPointB:pointB];
  int maxPoints = (lineLength / distance);
  NSMutableArray *allPoints = [[NSMutableArray alloc] initWithCapacity:maxPoints];
  
  for(int i=0; i<maxPoints ; i++){
    CGPoint point = [LineVectorUtils getPointlongLineFromPointA:pointA pointB:pointB atDistance:distance*(i+1) fromPoint:pointA];
    [allPoints addObject:[NSValue valueWithCGPoint:point]];
  }
  return allPoints;
}

+(CGPoint)getPointlongLineFromPointA:(CGPoint)pointA pointB:(CGPoint)pointB atDistance:(CGFloat)distance fromPoint:(CGPoint)pointC{
  CGPoint unitVector = [LineVectorUtils getUnitVectorAlongLineForPointA:pointA pointB:pointB];
  CGPoint finalPoint;
  finalPoint.x = pointC.x + distance*unitVector.x;
  finalPoint.y = pointC.y + distance*unitVector.y;
  return finalPoint;
}

+(CGPoint)getUnitVectorAlongLineForPointA:(CGPoint)pointA pointB:(CGPoint)pointB{
  CGPoint unitVector;
  CGFloat absoluteDistanceBetweenTwoPoints = sqrt(pow((pointB.x - pointA.x), 2) + pow((pointB.y - pointA.y), 2));
  
  if (absoluteDistanceBetweenTwoPoints == 0) {
    [NSException raise:NSGenericException
                format:@"You must provide two seperate points %@", NSStringFromSelector(_cmd)];
    return CGPointZero;
  }
  
  unitVector.x = (pointB.x - pointA.x)/absoluteDistanceBetweenTwoPoints;
  unitVector.y = (pointB.y - pointA.y)/absoluteDistanceBetweenTwoPoints;

  return unitVector;
}

+(CGFloat)getLengthOfLineFromPointA:(CGPoint)pointA toPointB:(CGPoint)pointB{
  return sqrt(pow((pointB.x - pointA.x), 2) + pow((pointB.y - pointA.y), 2));
}

//return two points on a line (given line's slope and a point on the line), that are on either side of a third point lying on the line
+(NSArray *)getTwoEquidistantPointsOnALineWithSlope:(CGFloat)slope aPointOnTheLine:(CGPoint)point atDistance:(CGFloat)distance fromPoint:(CGPoint)anotherPoint
{
  //get one more point on the line
  CGPoint secondPointOnTheSameLine;
  secondPointOnTheSameLine.x = point.x - 20;//a random point
  secondPointOnTheSameLine.y = slope*(secondPointOnTheSameLine.x - point.x) + point.y;
  
  CGPoint firstPoint = [LineVectorUtils getPointlongLineFromPointA:point pointB:secondPointOnTheSameLine atDistance:distance fromPoint:point];
  CGPoint secondPoint = [LineVectorUtils getPointlongLineFromPointA:point pointB:secondPointOnTheSameLine atDistance:-distance fromPoint:point];
  
  return [[NSArray alloc] initWithObjects:[NSValue valueWithCGPoint:firstPoint],[NSValue valueWithCGPoint:secondPoint], nil];
}

+(double)calculateSlopeForPointA:(CGPoint)pointA pointB:(CGPoint)pointB{
  return (pointA.y - pointB.y)/(pointA.x-pointB.x);
}
@end

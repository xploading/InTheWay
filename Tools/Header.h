//
//  Header.h
//  XPInTheWay
//
//  Created by qianfeng on 2016/12/14.
//  Copyright © 2016年 耿晓鹏. All rights reserved.
//

#ifndef Header_h
#define Header_h
#import "XTADScrollView.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>//高德地图库
#import <AMapSearchKit/AMapSearchKit.h>//搜索框架


////首页
//#define kURLfeatured @"http://chanyouji.com/api/trips/featured.json?page=%ld"
//#define kURLTripArticle @"http://chanyouji.com/api/trips/30543.json?page=0""
//轮播地址
#define ScrollImage @"http://api.klook.com/rest/themes/108.json?_t=1457182372640"


////专题(用这个)
#define kURLSub @"http://chanyouji.com/api/articles.json?page=%ld"
#define KURLArticle @"http://chanyouji.com/api/articles/%ld.json?page=%ld"
//热门
#define KURLHOT @"http://api.breadtrip.com/trips/hot/?start=%ld&count=10&is_ipad=true"
#define KURLDETAILE @"http://api.breadtrip.com/trips/%@"
//目的地
#define KURLDes @"http://chanyouji.com/api/destinations.json?page=%ld"
#define UMKEY @"5635e44767e58e4d9d000e55"
//口袋书
#define KURLBook @"http://chanyouji.com/api/destinations/%ld.json?page=%ld"
#define KEY @"9195756fd791c3aa0da87de5b8fc4bd5"
//行程
#define kURLTraval @"http://chanyouji.com/api/destinations/plans/%ld.json?page=%ld"
//行程详情
#define kURLPlansDetail @"http://chanyouji.com/api/plans/%ld.json?page=1"
//旅行地
#define kURLLocation @"http://chanyouji.com/api/destinations/attractions/%ld.json?per_page=20&page=%ld"
//旅行地详情
#define kURLAttractionDetail @"http://chanyouji.com/api/attractions/%ld.json?page=1"
//目的地专题
#define kURLDesSub @"http://chanyouji.com/api/articles.json?destination_id=%ld.json&page=%ld"

//查询游记
#define kURLSearchTrip @"http://chanyouji.com/api/search/trips.json?q=%@&page=%ld"



#endif /* Header_h */

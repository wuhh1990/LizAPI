//
//  MSAPIHelper.m
//  Zhuangpin
//
//  Created by wuhh on 16/1/5.
//  Copyright © 2016年 ZhuangPin. All rights reserved.
//

#import "MSAPIHelper.h"

@implementation MSAPIHelper



/// AppDelegate   第三方 快捷登录
+ (NSURLSessionDataTask *)API_QuickLogin:(UIViewController*)vc
                                   param:(id)param
                                   block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:USER_HOST_URL
                      url:API_User_QuickLogin
                    param:param
                      tag:HTagNone
                    block:block];
}

/// AppDelegate 登录验证   ///MSLoginBindVC  请求个人信息
+ (NSURLSessionDataTask *)API_GetUserInfo:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:USER_HOST_URL
                            url:ZP_MY_Get_Info
                          param:param
                            tag:HTagNone
                          block:block];
}


/// AppDelegate  第三方绑定
+ (NSURLSessionDataTask *)API_Bind:(UIViewController*)vc
                             param:(id)param
                             block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                     host:USER_HOST_URL
                      url:ZP_Openuser_Bine
                    param:param
                      tag:HTagNone
                    block:block];
}

/// AppDelegate  推送设备信息clientId发送到服务器
+ (NSURLSessionDataTask *)API_GeTui:(UIViewController*)vc
                              param:(id)param
                              block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:ZP_HOST_URL
                            url:ZP_GeTuiPush_Add
                          param:param
                            tag:HTagNone
                          block:block];
}


///MSBillView  ///MSMakeUpStoreVC  个人妆品 消费清单
+ (NSURLSessionDataTask *)API_ZPCostList:(UIViewController*)vc
                                   param:(id)param
                                   block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_ListCost
                    param:param
                      tag:10001
                    block:block];
}


///MSClockGuideOneVC   最近测试的水份数值   通过此进行影响 面膜闹钟的设置
+ (NSURLSessionDataTask *)API_NewestMoisture:(UIViewController*)vc
                                       param:(id)param
                                       block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:@"/api/skin/newestmoisture"
                          param:param
                            tag:HTagNone
                          block:block];
}


///MSFitAccountsViewController  健康秤 用户列表.  (注：健康秤用户 与 App用户 是独立的用户信息)
+ (NSURLSessionDataTask *)API_FitUserList:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_FIT
                            url:f_userlist_url
                          param:param
                            tag:HTagNone
                          block:block];
}



///MSFitAccountsViewController  健康秤 用户列表.  (注：健康秤用户 与 App用户 是独立的用户信息)
+ (NSURLSessionDataTask *)API_FitDelUser:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_FIT
                            url:f_deleteuser_url
                          param:param
                            tag:HTagNone
                          block:block];
}


///MSLoginBindVC  获取验证码
+ (NSURLSessionDataTask *)API_GetCode:(UIViewController*)vc
                                param:(id)param
                                block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:USER_HOST_URL
                      url:API_User_GetCode
                    param:param
                      tag:HTagNone
                    block:block];
}

///MSLoginBindVC  验证验证码
+ (NSURLSessionDataTask *)API_VerifyCode:(UIViewController*)vc
                                   param:(id)param
                                   block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:USER_HOST_URL
                      url:API_User_Bind
                    param:param
                      tag:HTagNone
                    block:block];
}

///MSLoginBindVC  提交注册[1]
+ (NSURLSessionDataTask *)API_Resiger:(UIViewController*)vc
                                param:(id)param
                                block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:USER_HOST_URL
                       url:ZP_User_Register
                     param:param
                       tag:HTagNone
                     block:block];
}

///MSLoginBindVC  绑定第三方信息  迁移数据接口[2]    (未绑定手机的第三方，登录绑定并且迁移数据 到绑定手机)
+ (NSURLSessionDataTask *)API_Bind_NewUser:(UIViewController*)vc
                                     param:(id)param
                                     block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                     host:USER_HOST_URL
                      url:API_User_BindNewRegister
                    param:param
                      tag:HTagNone
                    block:block];
}

///MSLoginBindVC  请求登录
+ (NSURLSessionDataTask *)API_Login:(UIViewController*)vc
                              param:(id)param
                              block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:USER_HOST_URL
                       url:ZP_USER_LOGIN
                     param:param
                       tag:10002
                     block:block];
}


///MSPasswordVerifyViewController  请求登录
+ (NSURLSessionDataTask *)API_ChangePassword:(UIViewController*)vc
                                       param:(id)param
                                       block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                     host:USER_HOST_URL
                      url:MS_My_Updatepassword
                    param:param
                      tag:HTagNone
                    block:block];
}


///MSProductContrastView   产品对比图(不同产品护肤前后水份数据)
+ (NSURLSessionDataTask *)API_Product_Contrast:(UIViewController*)vc
                                         param:(id)param
                                         block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:@"/api/skin/zpshow/v/2/"
                          param:param
                            tag:HTagNone
                          block:block];
}

///MSProductDetailVC   打开产品
+ (NSURLSessionDataTask *)API_ZPGoodOpen:(UIViewController*)vc
                               param:(id)param
                               block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_Open
                    param:param
                      tag:10003
                    block:block];
}

///MSProductDetailVC   删除产品
+ (NSURLSessionDataTask *)API_ZPGoodDelete:(UIViewController*)vc
                                     param:(id)param
                                     block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_Delete
                    param:param
                      tag:10004
                    block:block];
}

///MSProductDetailVC   用完产品
+ (NSURLSessionDataTask *)API_ZPGoodUseup:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_UseUp
                    param:param
                      tag:10005
                    block:block];
}

///MSProductDetailVC   编辑产品
+ (NSURLSessionDataTask *)API_ZPGoodEdit:(UIViewController*)vc
                                   param:(id)param
                                   block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:ZP_HOST_URL
                       url:API_ZP_Edit
                     param:param
                       tag:10006
                     block:block];
}

///MSProductDetailVC   请求产品标签
+ (NSURLSessionDataTask *)API_ZPGoodLabel:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_Label
                    param:param
                      tag:10007
                    block:block];
}


///MSProductDetailVC   请求评分 打标签
+ (NSURLSessionDataTask *)API_ZPGoodGrade:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                     host:ZP_HOST_URL
                      url:API_ZP_Grade
                    param:param
                      tag:10008
                    block:block];
}

///MSProductDetailVC   请求评分列表   "我的妆品"->"产品信息"->
+ (NSURLSessionDataTask *)API_ZPGradeList:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_GradeList
                    param:param
                      tag:10009
                    block:block];
}


///MSProductDetectionView(二代产品测试)   MSSkinIIView(二代)  PBADailyDetectionView(一代)
///PBAProductDetectionView(一代产品测试)
///对产品 水份测试 后保存数据
+ (NSURLSessionDataTask *)API_GoodTestSave:(UIViewController*)vc
                                     param:(id)param
                                     block:(API_BLOCK)block
{
    return [MSRequest POSTCookie:vc
                            host:HOST_URL_JIFU
                             url:KPBA_SKIN_ADD
                           param:param
                             tag:10010
                           block:block];
}



///MSProductHistoryView   单个产品的多次测试结果 （即历史记录列表）
+ (NSURLSessionDataTask *)API_GoodTestHistoryList:(UIViewController*)vc
                                            param:(id)param
                                            block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:@"/api/skin/singlezp/v/2/"
                          param:param
                            tag:10011
                          block:block];
}



///MSProductInfoVC    ///"MSTuiJianView"-> 推荐的产品信息
///ZPBaikeVC
+ (NSURLSessionDataTask *)API_TuiJianGoodGradeList:(UIViewController*)vc
                                             param:(id)param
                                             block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_GradeList_Productid
                    param:param
                      tag:10012
                    block:block];
}

///MSSelectedGoodVC  个人妆品中心 的妆品数据表
+ (NSURLSessionDataTask *)API_ZPList:(UIViewController*)vc
                               param:(id)param
                               block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_List
                    param:param
                      tag:10013
                    block:block];
    
    
}

///MSSKinAnalyseViewController  部位 历史测试结果 折线图 数据
+ (NSURLSessionDataTask *)API_TrendAnalyse:(UIViewController*)vc
                                     param:(id)param
                                     block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:KMS_SKIN_TRENDANALYSE
                          param:param
                            tag:10014
                          block:block];
}



///MSSkinEntranceVC   请求 各个部位的 最近一个水份测试结果
+ (NSURLSessionDataTask *)API_SkinRecord:(UIViewController*)vc
                                   param:(id)param
                                   block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:KPBA_SKIN_TAGLIST_V2
                          param:param
                            tag:10015
                          block:block];
}

///MSSkinHelpTableView  肌肤检测仪一代的使用帮助
+ (NSURLSessionDataTask *)API_SkinIHelp:(UIViewController*)vc
                                  param:(id)param
                                  block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:MUSHU_HOST_URL
                            url:KMS_SKIN_RELATE_MODULE
                          param:param
                            tag:10016
                          block:block];
}

///MSSkinIIOTAView  肌肤检测仪二代  固件升级  检测版本
+ (NSURLSessionDataTask *)API_SkinIIFirmwareInfo:(UIViewController*)vc
                                           param:(id)param
                                           block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:API_OTA_Update
                          param:param
                            tag:HTagNone
                          block:block];
}


///MSSkinIIView  进入肌肤测试界面(二代)  请求 使用提示
+ (NSURLSessionDataTask *)API_SkinIIFirstPageTip:(UIViewController*)vc
                                           param:(id)param
                                           block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:KMS_SKINII_FIRSTPAGE
                          param:param
                            tag:HTagNone
                          block:block];
}

///MSSkinIIView  肌肤测试界面  测试结束后，根据测试的数据 请求相应的推荐产品
+ (NSURLSessionDataTask *)API_SkinRecommendProduct:(UIViewController*)vc
                                             param:(id)param
                                             block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                     host:HOST_URL_JIFU
                      url:@"/api/cosmeticmanage/commendproduct/"
                    param:param
                      tag:HTagNone
                    block:block];
}


///MSSkinIIView  ///PBADailyDetectionView  肌肤测试界面  测试结束后，根据测试的数据 请求应的分析结果
///PBAProductDetectionView(肌肤产品测试一代)
+ (NSURLSessionDataTask *)API_SkinAnalyse:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest POSTCookie:vc
                      host:HOST_URL_JIFU
                       url:KMS_SKIN_ANALYSE
                     param:param
                       tag:HTagNone
                     block:block];
}

///MSSkinQualityVC - Delete


///MSSkinRecordTableView - 暂时不用了.  最近的肌肤检测结果数据
+ (NSURLSessionDataTask *)API_SkinRecordOld:(UIViewController*)vc
                                      param:(id)param
                                      block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:KMS_SKIN_TAGLIST2
                          param:param
                            tag:HTagNone
                          block:block];
}


///MSSkinViewController  //@"/api/label/isexistrecord"



///MSSunShineVC   日照界面 获取到 紫外线强度 给用户提醒
+ (NSURLSessionDataTask *)API_UVTipWith:(UIViewController*)vc
                                  param:(id)param
                                  block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:API_SKIN_UV_TIPS
                          param:param
                            tag:HTagNone
                          block:block];
}

///MSSunShineVC   日照界面 获取到 紫外线吸收指数后 给用户提醒
+ (NSURLSessionDataTask *)API_SunShineTip:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:API_SKIN_SUNSHINE_TIPS
                          param:param
                            tag:HTagNone
                          block:block];
}




///MSTelBindingViewController
+ (NSURLSessionDataTask *)API_TelBind_GetCode:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                     host:USER_HOST_URL
                      url:ZP_Openuser_Bindverifycode
                    param:param
                      tag:HTagNone
                    block:block];
}

+ (NSURLSessionDataTask *)API_TelBind:(UIViewController*)vc
                                param:(id)param
                                block:(API_BLOCK)block
{
    return [MSRequest POSTCookie:vc
                            host:USER_HOST_URL
                             url:ZP_Openuser_Bindverifyverifycode
                           param:param
                             tag:HTagNone
                           block:block];
}


///MSTelVerifyViewController
+ (NSURLSessionDataTask *)API_FindPassword_GetCode:(UIViewController*)vc
                                             param:(id)param
                                             block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:USER_HOST_URL
                       url:ZP_User_Findpasswordsendcode
                     param:param
                       tag:HTagNone
                     block:block];
}

+ (NSURLSessionDataTask *)API_FindPassword_VerifyCode:(UIViewController*)vc
                                        param:(id)param
                                        block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:USER_HOST_URL
                       url:ZP_User_Findpasswordverifycode
                     param:param
                       tag:1
                     block:block];
}

+ (NSURLSessionDataTask *)API_FindPassword_SubmitPassword:(UIViewController*)vc
                                                    param:(id)param
                                                    block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:USER_HOST_URL
                       url:ZP_User_Findpasswordmodifypassword
                     param:param
                       tag:HTagNone
                     block:block];
}

///MSZPMainVC  ///请求妆品数量
+ (NSURLSessionDataTask *)API_ZpCount:(UIViewController*)vc
                                param:(id)param
                                block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:ZP_HOST_URL
                            url:API_ZP_MAIN_ZPCOUNT
                          param:param
                            tag:HTagNone
                          block:block];
}


///MSZPMainVC  ///请求热门功效
+ (NSURLSessionDataTask *)API_ZpHotEffects:(UIViewController*)vc
                                     param:(id)param
                                     block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_MAIN_HOT_EFFECTS
                    param:param
                      tag:HTagNone
                    block:block];
}


///MSZPMainVC  ///请求热门妆品
+ (NSURLSessionDataTask *)API_ZpHotProducts:(UIViewController*)vc
                                      param:(id)param
                                      block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_MAIN_HOT_PRODUCTS
                    param:param
                      tag:HTagNone
                    block:block];
}



///MSZPPerfectPhotoVC   ///图片传到Yun后, 把Yun生成的图片链接发给服务器.
+ (NSURLSessionDataTask *)API_TakePhoto_SendImgUrl:(UIViewController*)vc
                                             param:(id)param
                                             block:(API_BLOCK)block
{
    return [MSRequest POSTCookie:vc
                            host:ZP_HOST_URL
                             url:@"/api/cosmeticnew/addauditphoto/"
                           param:param
                             tag:HTagNone
                           block:block];
}

/*
 PBAAnalyzeViewController
 PBADataRecordViewController
 PBASetTargetController
 秤的历史数据
*/
+ (NSURLSessionDataTask *)API_Fit_RecordList:(UIViewController*)vc
                                       param:(id)param
                                       block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_FIT
                            url:f_recordlist_url
                          param:param
                            tag:HTagNone
                          block:block];
}

///PBAAnalyzeViewController  PBAFitDeviceController  根据秤的历史数据 给出分析数据文案
+ (NSURLSessionDataTask *)API_Fit_RecordAnalyse:(UIViewController*)vc
                                          param:(id)param
                                          block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:HOST_URL_FIT
                       url:f_analyzerecord_url
                     param:param
                       tag:HTagNone
                     block:block];
}

///PBAClockViewController


///PBADailyDetectionView    进入肌肤测试界面(一代)
///PBAProductDetectionView  进入肌肤产品测试界面(一代)
///请求 使用提示
+ (NSURLSessionDataTask *)API_SkinFirstPageTip:(UIViewController*)vc
                                         param:(id)param
                                         block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:KMS_SKIN_FIRSTPAGE
                          param:param
                            tag:HTagNone
                          block:block];
}



/*
 PBADataRecordViewController  
 PBAFitDeviceController
 PBASetTargetController
 秤的 请求目标设置
*/
+ (NSURLSessionDataTask *)API_FIT_GetTarget:(UIViewController*)vc
                                      param:(id)param
                                      block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_FIT
                            url:f_mytarget_url
                          param:param
                            tag:HTagNone
                          block:block];
}


///PBAEditeClockViewController

///PBAEditInfoController  新增加秤的 用户
+ (NSURLSessionDataTask *)API_FIT_AddUser:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:HOST_URL_FIT
                       url:f_adduser_url
                     param:param
                       tag:HTagNone
                     block:block];
}

///PBAEditInfoController  秤的住帐号资料修改
+ (NSURLSessionDataTask *)API_FIT_UpdateUserInfo:(UIViewController*)vc
                                           param:(id)param
                                           block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:HOST_URL_FIT
                       url:f_updateuser_url
                     param:param
                       tag:HTagNone
                     block:block];
}

///PBAFitDeviceController
+ (NSURLSessionDataTask *)API_FIT_Save:(UIViewController*)vc
                                 param:(id)param
                                 block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:HOST_URL_FIT
                       url:f_addrecode_url
                     param:param
                       tag:HTagNone
                     block:block];
}

+ (NSURLSessionDataTask *)API_FIT_IsActive:(UIViewController*)vc
                                     param:(id)param
                                     block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_FIT
                            url:f_isactive_url
                          param:param
                            tag:HTagNone
                          block:block];
}

+ (NSURLSessionDataTask *)API_FIT_GetUseInfo:(UIViewController*)vc
                                       param:(id)param
                                       block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_FIT
                            url:f_user_info_url
                          param:param
                            tag:HTagNone
                          block:block];
}


///PBAProductDetectionView   一代产品测试界面
//测试结果提示
+ (NSURLSessionDataTask *)API_SKIN_AnalyzeDaily:(UIViewController*)vc
                                             param:(id)param
                                             block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:@"/api/skin/analysedaily/"
                          param:param
                            tag:HTagNone
                          block:block];
}



+ (NSURLSessionDataTask *)API_SKIN_Daily:(UIViewController*)vc
                                   param:(id)param
                                   block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:HOST_URL_JIFU
                            url:KPBA_SKIN_DAILY
                          param:param
                            tag:HTagNone
                          block:block];
}



///PBAQuestionsDetailVC
+ (NSURLSessionDataTask *)API_SKIN_HelpDetail:(UIViewController*)vc
                                        param:(id)param
                                        block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:MUSHU_HOST_URL
                      url:KMS_SKIN_FAQ_CONTENT
                    param:param
                      tag:10017
                    block:block];
}







///PBASetTargetController
+ (NSURLSessionDataTask *)API_FIT_SetTarget:(UIViewController*)vc
                                      param:(id)param
                                      block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:HOST_URL_FIT
                       url:f_add_target_url
                     param:param
                       tag:HTagNone
                     block:block];
}

///ZPAddBarVC
+ (NSURLSessionDataTask *)API_GetProductInfoFromBarcode:(UIViewController*)vc
                                                  param:(id)param
                                                  block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_BARCODE_REQUEST
                    param:param
                      tag:HTagNone
                    block:block];
}

///ZPAddProductController
+ (NSURLSessionDataTask *)API_GetProductListByBand:(UIViewController*)vc
                                             param:(id)param
                                             block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:ZP_HOST_URL
                            url:API_ZP_GET_PRODUCTS_BYBAND
                          param:param
                            tag:10018
                          block:block];
}

+ (NSURLSessionDataTask *)API_AddProduct:(UIViewController*)vc
                                   param:(id)param
                                   block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:ZP_HOST_URL
                       url:API_ZP_AddCosmetic
                     param:param
                       tag:10019
                     block:block];
}


///ZPBaikeVC
+ (NSURLSessionDataTask *)API_GetProductBaike:(UIViewController*)vc
                                        param:(id)param
                                        block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                      host:ZP_HOST_URL
                       url:API_ZP_BAIKE_DETAIL
                     param:param
                       tag:10020
                     block:block];
}


+ (NSURLSessionDataTask *)API_GetProductLabel:(UIViewController*)vc
                                        param:(id)param
                                        block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_Baike_Label
                    param:param
                      tag:10021
                    block:block];
}




///ZPBillsLineChartView

///ZPBillsViewController   账单分析
+ (NSURLSessionDataTask *)API_ZPBill:(UIViewController*)vc
                               param:(id)param
                               block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:ZP_HOST_URL
                            url:ZP_My_Billstat
                          param:param
                            tag:10022
                          block:block];
}


///ZPChengFenDetailVC
+ (NSURLSessionDataTask *)API_GetChengFen:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_BAIKE_INGREDIENT_DETAIL
                    param:param
                      tag:10023
                    block:block];
}

///ZPChengFenVC
+ (NSURLSessionDataTask *)API_GetChengFenList:(UIViewController*)vc
                                        param:(id)param
                                        block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_BAIKE_INGREDIENT_LIST
                    param:param
                      tag:10024
                    block:block];
}






///ZPRegisterViewController
+ (NSURLSessionDataTask *)API_GetRegisterCode:(UIViewController*)vc
                                        param:(id)param
                                        block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:USER_HOST_URL
                       url:ZP_User_Findregistercode
                     param:param
                       tag:10025
                     block:block];
}

///MSLoginBindVC  验证验证码
+ (NSURLSessionDataTask *)API_VerifyRegisterCode:(UIViewController*)vc
                                           param:(id)param
                                           block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:USER_HOST_URL
                       url:ZP_User_Registerverifycode
                     param:param
                       tag:HTagNone
                     block:block];
}



///ZPSendAdviceController   反馈信息
+ (NSURLSessionDataTask *)API_SendFeedback:(UIViewController*)vc
                                     param:(id)param
                                     block:(API_BLOCK)block
{
    return [MSRequest POST:vc
                      host:MUSHU_HOST_URL
                       url:ZP_advice_url
                     param:param
                       tag:HTagNone
                     block:block];
}



///ZPUpdateVersionHelper
+ (NSURLSessionDataTask *)API_Version:(UIViewController*)vc
                                param:(id)param
                                block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                      host:MUSHU_HOST_URL
                       url:ZP_CHECK_VERSION_URL
                     param:param
                       tag:HTagNone
                     block:block];
}


///ZPUserInfoViewController   用户个人信息

//绑定信息
+ (NSURLSessionDataTask *)API_BindInfo:(UIViewController*)vc
                                 param:(id)param
                                 block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:USER_HOST_URL
                      url:API_User_BindInfo
                    param:param
                      tag:10026
                    block:block];
}

+ (NSURLSessionDataTask *)API_UnBind:(UIViewController*)vc
                               param:(id)param
                               block:(API_BLOCK)block
{
    return [MSRequest POSTCookie:vc
                            host:USER_HOST_URL
                             url:API_User_Unbind
                           param:param
                             tag:10027
                           block:block];
}


+ (NSURLSessionDataTask *)API_EditUserInfo:(UIViewController*)vc
                                     param:(id)param
                                     block:(API_BLOCK)block
{
    return [MSRequest POSTCookie:vc
                            host:USER_HOST_URL
                             url:ZP_My_Updateinfo
                           param:param
                             tag:10028
                           block:block];
}










/// 肌肤类型  MSHomeVC
+ (NSURLSessionDataTask *)API_SkinType:(UIViewController*)vc
                                 param:(id)param
                                 block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:ZP_HOST_URL
                            url:API_HOME_SKINTYPE
                          param:param
                            tag:10029
                          block:block];
}


/// 最近过期妆品信息  MSHomeVC
+ (NSURLSessionDataTask *)API_ZPExpire:(UIViewController*)vc
                                 param:(id)param
                                 block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                           host:ZP_HOST_URL
                            url:@"/api/cosmeticmanage/expireproduct/"
                          param:param
                            tag:HTagNone
                          block:block];
}


/// 妆品消费排名 MSConsumeListVC
+ (NSURLSessionDataTask *)API_ZPRank:(UIViewController*)vc
                               param:(id)param
                               block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_Rank
                    param:param
                      tag:10030
                    block:block];
}

/// 我的妆品消费排名 MSConsumeListVC
+ (NSURLSessionDataTask *)API_MYRank:(UIViewController*)vc
                               param:(id)param
                               block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_MyRank
                    param:param
                      tag:10031
                    block:block];
}

/// 星座信息 ConstellationVC
+ (NSURLSessionDataTask *)API_Constellation:(UIViewController*)vc
                                      param:(id)param
                                      block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:MUSHU_HOST_URL
                      url:@"/api/astro/todayinfo/"
                    param:param
                      tag:10032
                    block:block];
}


/// 保存生日 ConstellationVC



/// 请求体感温度  MSEnvironmentShareVC
+ (NSURLSessionDataTask *)API_BodyFeelTip:(UIViewController*)vc
                                    param:(id)param
                                    block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                     host:HOST_URL_JIFU
                      url:API_SKIN_BODYFEEL_TEMP_TIPS
                    param:param
                      tag:10033
                    block:block];
}



/// 请求环境分享数据 MSEnvironmentShareVC
+ (NSURLSessionDataTask *)API_EnShareData:(UIViewController*)vc
                                   param:(id)param
                                   block:(API_BLOCK)block
{
    return [MSRequest GETCookie:vc
                     host:HOST_URL_JIFU
                      url:@"/api/share/add/"
                    param:param
                      tag:10034
                    block:block];
}



/// MSZPFilter
+ (NSURLSessionDataTask *)API_Search:(UIViewController*)vc
                               param:(id)param
                               block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_ZP_SEARCH_KEYWORD
                    param:param
                      tag:HTagNone
                    block:block];
}



/// MSSkinQuestionTypeVC  肌肤问卷 结果列表 显示
+ (NSURLSessionDataTask *)API_ShowSkinType:(UIViewController*)vc
                                     param:(id)param
                                     block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_SKIN_QUESTION_DEFAULT_SKINTYPES
                    param:param
                      tag:HTagNone
                    block:block];
}

/// MSSkinQuestionTypeVC  肌肤问卷 结果列表 保存
+ (NSURLSessionDataTask *)API_SaveSkinType:(UIViewController*)vc
                                     param:(id)param
                                     block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_SKIN_QUESTION_DEFAULT_SKINTYPES_SAVE
                    param:param
                      tag:HTagNone
                    block:block];
}



/// MSSkinQuestionTypeResultVC  肌肤问卷 单项结果显示.
+ (NSURLSessionDataTask *)API_SkinTypeResult:(UIViewController*)vc
                                       param:(id)param
                                       block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_SKIN_QUESTION_SINGLE_RESULT
                    param:param
                      tag:HTagNone
                    block:block];
}



/// MSSkinQuestionComplexVC  肌肤问卷 最终结果
+ (NSURLSessionDataTask *)API_ComplexResult:(UIViewController*)vc
                                      param:(id)param
                                      block:(API_BLOCK)block
{
    return [MSRequest GET:vc
                     host:ZP_HOST_URL
                      url:API_SKIN_QUESTION_COMPLEX_RESULT
                    param:param
                      tag:HTagNone
                    block:block];
}


@end



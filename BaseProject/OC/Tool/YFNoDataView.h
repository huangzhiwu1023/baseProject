//
//  YFNoDataView.h
//  jsyf_user
//
//  Created by 黄志武 on 2017/10/23.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  没有数据的展示View
 */

typedef NS_ENUM(NSUInteger, YFNoDataViewType) {
    YFNoDataViewTypeNone,           // 自定义
    YFNoDataViewTypeSearch,           // 搜索空场
};

/**
 例：
 为了统一管理空场页面，将显示的图片、文字集中处理
 使用方法：
  1.添加枚举
  2.设置文字、图片
  3.引用空场
 Swift:==========
 1.创建空场
 fileprivate let emptyView: YFNoDataView = {
 let view = YFNoDataView(frame: CGRect.zero)
 view.viewType = .searchSchool
 view.isHidden = true
 return view
 }()
 2.添加空场
 view.addSubview(emptyView)
 emptyView.snp.makeConstraints { (make) in
 make.edges.equalToSuperview()
 }
 3.设置空场
 if dataArray.isEmpty {
 emptyView.isHidden = false
 } else {
 emptyView.isHidden = true
 }
 
 OC:=========
 @property (nonatomic, strong) YFNoDataView *noDataView;
 
 - (YFNoDataView *)noDataView
 {
 if (!_noDataView) {
 _noDataView = [[YFNoDataView alloc] initWithFrame:self.view.bounds];
 _noDataView.viewType = YFNoDataViewTypeInvestOrder;
 [self.view addSubview:_noDataView];
 }
 return _noDataView;
 }
 
 if (weakSelf.orderVM.dataArray.count <= 0) {
 weakSelf.noDataView.hidden = NO;
 } else {
 weakSelf.noDataView.hidden = YES;
 }
 */

@interface YFNoDataView : UIView

@property (nonatomic, assign) YFNoDataViewType viewType;

@property (nonatomic, strong) UIImage *noDataImage;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *detailText;

@property (nonatomic, strong) UIButton *bottomButton;

@property (nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UIButton *refreshBtn;
@property (nonatomic, strong) UIImageView *noDataIV;
@end

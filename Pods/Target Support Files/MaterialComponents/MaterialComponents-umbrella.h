#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "MaterialAvailability.h"
#import "MDCAvailability.h"
#import "MaterialElevation.h"
#import "MDCElevatable.h"
#import "MDCElevationOverriding.h"
#import "UIColor+MaterialElevation.h"
#import "UIView+MaterialElevationResponding.h"
#import "MaterialNavigationDrawer.h"
#import "MDCBottomDrawerHeader.h"
#import "MDCBottomDrawerPresentationController.h"
#import "MDCBottomDrawerPresentationControllerDelegate.h"
#import "MDCBottomDrawerState.h"
#import "MDCBottomDrawerTransitionController.h"
#import "MDCBottomDrawerViewController.h"
#import "MDCBottomDrawerViewControllerDelegate.h"
#import "MaterialPalettes.h"
#import "MDCPalettes.h"
#import "MaterialShadowElevations.h"
#import "MDCShadowElevations.h"
#import "MaterialShadowLayer.h"
#import "MDCShadowLayer.h"
#import "MaterialApplication.h"
#import "UIApplication+MDCAppExtensions.h"
#import "MaterialColor.h"
#import "UIColor+MaterialBlending.h"
#import "UIColor+MaterialDynamic.h"
#import "MaterialMath.h"
#import "MDCMath.h"
#import "MaterialUIMetrics.h"
#import "MDCLayoutMetrics.h"

FOUNDATION_EXPORT double MaterialComponentsVersionNumber;
FOUNDATION_EXPORT const unsigned char MaterialComponentsVersionString[];


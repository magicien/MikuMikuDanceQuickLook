#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>

#import <SceneKit/SceneKit.h>
@import MMDSceneKit_macOS;

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options);
void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview);

/* -----------------------------------------------------------------------------
   Generate a preview for file

   This function's job is to create preview for designated file
   ----------------------------------------------------------------------------- */

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview, CFURLRef url, CFStringRef contentTypeUTI, CFDictionaryRef options)
{
    @autoreleasepool {
        SCNScene *scene = [[SCNScene alloc] init];

        MMDSceneSource *source = [[MMDSceneSource alloc] initWithURL:(__bridge NSURL*)url options:nil];
        
        if(QLPreviewRequestIsCancelled(preview)){
            return noErr;
        }
        
        SCNNode *modelNode = [source getModel];
        [scene.rootNode addChildNode:modelNode];
        
        NSData *scnData = [NSKeyedArchiver archivedDataWithRootObject:scene];
        NSLog(@"scnData size: %lu", (unsigned long)scnData.length);
        CFStringRef contentTypeUTI = CFSTR("com.apple.scenekit.scene");

        if(QLPreviewRequestIsCancelled(preview)){
            return noErr;
        }

        QLPreviewRequestSetDataRepresentation(preview, (__bridge CFDataRef)(scnData), contentTypeUTI, options);
        
        return noErr;
    }
}

void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview)
{
    // Implement only if supported
}

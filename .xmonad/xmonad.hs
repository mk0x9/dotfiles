import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed
import XMonad.Util.EZConfig

main = do c <- statusBar myBar myPP toggleStrutsKey myConfig
          xmonad c

myBar = "xmobar"

myPP = xmobarPP { ppCurrent = xmobarColor "#72b932" ""
                , ppUrgent = xmobarColor "yellow" "red" . xmobarStrip
                }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myConfig = withUrgencyHook NoUrgencyHook defaultConfig { terminal    = "urxvt256c-mlc"
                                                       , modMask     = mod4Mask
                                                       , borderWidth = 0
                                                       , workspaces  = ["[ tty ]", "[emacs]", "[ web ]", "[ im ]", "[media]", "[misc]"] ++ map show [7..8] ++ ["[gimp]"]
                                                       , manageHook  = manageHook defaultConfig <+> manageDocks
                                                       , layoutHook  = tiled ||| tabbed shrinkText defaultTheme ||| Full
                                                       }
           `additionalKeysP`
           [ ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 5")
           , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 5")
           ]
           where tiled   = Tall nmaster delta ratio
                 nmaster = 1
                 ratio   = 1/2
                 delta   = 3/100

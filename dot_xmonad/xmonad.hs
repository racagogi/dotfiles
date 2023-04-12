import qualified Data.Map as M
import Graphics.X11.ExtraTypes.XF86
import System.Exit
import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Config.Desktop
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Grid
import qualified XMonad.Layout.LayoutModifier
import XMonad.Layout.Spacing
import qualified XMonad.StackSet as W

main :: IO ()
main = do
  xmonad . ewmhFullscreen $ ewmh defaults

defaults =
  def
    { terminal = "wezterm",
      focusFollowsMouse = False,
      clickJustFocuses = False,
      borderWidth = 0,
      modMask = mod4Mask,
      workspaces = myWorkspaces,
      keys = myKeys,
      layoutHook = myLayout,
      manageHook = manageSpawn <+> manageHook desktopConfig <+> myManageHook,
      handleEventHook = handleEventHook desktopConfig,
      startupHook = myStartupHook
    }

myWorkspaces :: [String]
myWorkspaces = ["١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"]

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm}) =
  M.fromList $
    [ ((modm, xK_space), sendMessage NextLayout),
      ((modm, xK_j), windows W.focusDown),
      ((modm, xK_k), windows W.focusUp),
      ((modm, xK_Return), windows W.swapMaster),
      ((modm .|. shiftMask, xK_j), windows W.swapDown),
      ((modm .|. shiftMask, xK_k), windows W.swapUp),
      ((modm, xK_t), withFocused $ windows . W.sink),
      ((modm .|. shiftMask, xK_q), io exitSuccess),
      ((modm .|. shiftMask, xK_c), kill),
      ((noModMask, xF86XK_Calculator), spawn $ XMonad.terminal conf),
      ((noModMask, xK_Print), spawn "maim -s ~/$(date +%Y-%m-%d-%H-%M-%S).png"),
      ((noModMask, xF86XK_MenuKB), spawn "vivaldi-stable"),
      ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"),
      ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%"),
      ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
    ]
      ++ [ ((m .|. modm, k), windows $ f i)
           | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9],
             (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
         ]
      ++ [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
           | (key, sc) <- zip [xK_w, xK_e, xK_r] [0 ..],
             (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
         ]

myLayout ::
  XMonad.Layout.LayoutModifier.ModifiedLayout
    AvoidStruts
    ( XMonad.Layout.LayoutModifier.ModifiedLayout
        Spacing
        (Choose Tall (Choose Grid Full))
    )
    Window
myLayout = avoidStruts $ spacingRaw True (Border 8 0 8 0) True (Border 0 8 0 8) True $ tiled ||| Grid ||| Full
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1 / 2
    delta = 3 / 100

myStartupHook :: X ()
myStartupHook = do
  spawn "~/.xmonad/setup.sh &"

myManageHook :: ManageHook
myManageHook =
  composeAll
    [ className =? "feh" --> doFloat,
      className =? "io.github.celluloid_player.Celluloid" --> doFloat,
      isDialog --> doFloat
    ]

defaults ::
  XConfig
    ( XMonad.Layout.LayoutModifier.ModifiedLayout
        AvoidStruts
        ( XMonad.Layout.LayoutModifier.ModifiedLayout
            Spacing
            (Choose Tall (Choose Grid Full))
        )
    )

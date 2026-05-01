{
  self,
  inputs,
  ...
}: {
  flake.custom.userModules.aliceMangoConfig = {
    lib,
    pkgs,
    self,
    ...
  }: {
    wayland.windowManager.mango = {
      enable = true;
      settings = ''
        # Autostart
        exec-once = noctalia-shell

        # Window decoration
        blur=1
        blur_layer=1
        blur_optimized = 1
        blur_params_num_passes = 1
        blur_params_noise=0.015
        shadows=1
        layer_shadows=0
        shadow_only_floating=1
        shadows_size=10
        shadows_blur=15
        shadows_position_x=0
        shadows_position_y=4
        shadowscolor=0x16161dcc
        border_radius=12
        no_radius_when_single=0
        focused_opacity=1.0
        unfocused_opacity=1.0

        # Animations
        animations=1
        layer_animations=1
        animation_type_open=slide
        animation_type_close=slide
        animation_fade_in=1
        animation_fade_out=1
        tag_animation_direction=1
        zoom_initial_ratio=0.4
        zoom_end_ratio=0.8
        fadein_begin_opacity=0.5
        fadeout_begin_opacity=0.8
        animation_duration_move=400
        animation_duration_open=350
        animation_duration_tag=300
        animation_duration_close=500
        animation_duration_focus=0
        animation_curve_open=0.46,1.0,0.29,1
        animation_curve_move=0.46,1.0,0.29,1
        animation_curve_tag=0.46,1.0,0.29,1
        animation_curve_close=0.08,0.92,0,1

        # Scroller / tile layout
        scroller_structs=20
        scroller_default_proportion=0.5
        scroller_focus_center=0
        scroller_prefer_center=0
        scroller_default_proportion_single=1.0
        scroller_proportion_preset=0.333,0.5,0.667,1.0
        default_mfact=0.55
        default_nmaster=1
        smartgaps=0

        # Overview
        hotarea_size=10
        enable_hotarea=1
        ov_tab_mode=0
        overviewgappi=5
        overviewgappo=30

        # Misc
        no_border_when_single=0
        focus_on_activate=1
        sloppyfocus=1
        warpcursor=0
        focus_cross_monitor=0
        focus_cross_tag=0
        enable_floating_snap=0
        snap_distance=30
        cursor_size=24
        drag_tile_to_tile=1
        axis_bind_apply_timeout=100

        # Keyboard
        repeat_rate=40
        repeat_delay=250
        numlockon=0
        xkb_rules_layout=us
        xkb_rules_options=caps:escape

        # Touchpad
        disable_trackpad=0
        tap_to_click=1
        tap_and_drag=1
        drag_lock=1
        trackpad_natural_scrolling=1
        disable_while_typing=1
        left_handed=0
        middle_button_emulation=0
        swipe_min_threshold=1

        # Mouse
        mouse_natural_scrolling=0

        # Appearance — translated from Niri focus-ring/shadow colours
        gappih=8
        gappiv=8
        gappoh=8
        gappov=8
        scratchpad_width_ratio=0.8
        scratchpad_height_ratio=0.9
        borderpx=2
        rootcolor=0x16161dff
        bordercolor=0x2b1712ff
        focuscolor=0xe985b4ff
        maximizescreencolor=0xe985b4ff
        urgentcolor=0xad401fff
        scratchpadcolor=0x516c93ff
        globalcolor=0xe985b4ff
        overlaycolor=0x14a57cff

        # Tag layout rules
        tagrule=id:1,layout_name:tile
        tagrule=id:2,layout_name:tile
        tagrule=id:3,layout_name:tile
        tagrule=id:4,layout_name:tile
        tagrule=id:5,layout_name:tile
        tagrule=id:6,layout_name:tile
        tagrule=id:7,layout_name:tile
        tagrule=id:8,layout_name:tile
        tagrule=id:9,layout_name:tile

        bind=SUPER,r,reload_config

        # Core window management
        bind=SUPER,Return,spawn,${lib.getExe pkgs.kitty}
        bind=SUPER,q,killclient
        bind=SUPER,f,togglemaximizescreen
        bind=SUPER,g,togglefullscreen
        bind=SUPER+SHIFT,f,togglefloating
        bind=ALT,Tab,toggleoverview
        bind=ALT,z,toggle_scratchpad
        bind=SUPER,n,switch_layout
        bind=SUPER+SHIFT,e,quit

        # Focus (HJKL + arrow mirrors)
        bind=SUPER,h,focusdir,left
        bind=SUPER,l,focusdir,right
        bind=SUPER,k,focusdir,up
        bind=SUPER,j,focusdir,down
        bind=SUPER,Left,focusdir,left
        bind=SUPER,Right,focusdir,right
        bind=SUPER,Up,focusdir,up
        bind=SUPER,Down,focusdir,down

        # Move / swap window
        bind=SUPER+SHIFT,h,exchange_client,left
        bind=SUPER+SHIFT,l,exchange_client,right
        bind=SUPER+SHIFT,k,exchange_client,up
        bind=SUPER+SHIFT,j,exchange_client,down

        # Monitor focus
        bind=SUPER+CTRL,h,focusmon,left
        bind=SUPER+CTRL,l,focusmon,right

        # Resize window
        bind=SUPER,minus,resizewin,-50,+0
        bind=SUPER,equal,resizewin,+50,+0
        bind=SUPER+SHIFT,minus,resizewin,+0,-50
        bind=SUPER+SHIFT,equal,resizewin,+0,+50

        # Column width presets (replaces niri preset-column-widths)
        bind=SUPER,comma,set_proportion,0.333
        bind=SUPER,period,switch_proportion_preset

        # Gaps
        bind=ALT+SHIFT,x,incgaps,1
        bind=ALT+SHIFT,z,incgaps,-1
        bind=ALT+SHIFT,r,togglegaps

        # Tag (workspace) switch
        bind=SUPER,1,view,1,0
        bind=SUPER,2,view,2,0
        bind=SUPER,3,view,3,0
        bind=SUPER,4,view,4,0
        bind=SUPER,5,view,5,0
        bind=SUPER,6,view,6,0
        bind=SUPER,7,view,7,0
        bind=SUPER,8,view,8,0
        bind=SUPER,9,view,9,0

        # Move window to tag
        bind=SUPER+SHIFT,1,tag,1,0
        bind=SUPER+SHIFT,2,tag,2,0
        bind=SUPER+SHIFT,3,tag,3,0
        bind=SUPER+SHIFT,4,tag,4,0
        bind=SUPER+SHIFT,5,tag,5,0
        bind=SUPER+SHIFT,6,tag,6,0
        bind=SUPER+SHIFT,7,tag,7,0
        bind=SUPER+SHIFT,8,tag,8,0
        bind=SUPER+SHIFT,9,tag,9,0

        # Screenshots (replaces niri built-in; requires grimblast in packages)
        bind=NONE,Print,spawn,grimblast copy area
        bind=SUPER,Print,spawn,grimblast copy screen
        bind=SUPER+SHIFT,Print,spawn,grimblast copy window

        # Volume
        bind=NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+
        bind=NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-
        bind=NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

        # Brightness
        bind=NONE,XF86MonBrightnessUp,spawn,${lib.getExe pkgs.brightnessctl} s 5%+
        bind=NONE,XF86MonBrightnessDown,spawn,${lib.getExe pkgs.brightnessctl} s 5%-

        # Noctalia IPC
        bind=SUPER,s,spawn,${
          lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNoctalia
        } ipc call launcher toggle
        bind=SUPER,m,spawn,${
          lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNoctalia
        } ipc call media toggle
        bind=SUPER+ALT,l,spawn,${
          lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNoctalia
        } ipc call lockScreen lock
        bind=SUPER+SHIFT,t,spawn,${
          lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNoctalia
        } ipc call wallpaper toggle
        bind=SUPER+SHIFT,i,spawn,${
          lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNoctalia
        } ipc call controlCenter toggle
        bind=CTRL+ALT,Delete,spawn,${
          lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNoctalia
        } ipc call sessionMenu toggle
        bind=SUPER,v,spawn,${
          lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.aliceNoctalia
        } ipc call launcher clipboard

        # Apps
        bind=SUPER,w,spawn,helium
        bind=SUPER+ALT,w,spawn,flatpak run app.zen_browser.zen
        bind=SUPER,d,spawn,${lib.getExe pkgs.wlr-which-key}
        bind=SUPER,e,spawn,${lib.getExe pkgs.nautilus}

        # Mouse
        mousebind=SUPER,btn_left,moveresize,curmove
        mousebind=NONE,btn_middle,togglemaximizescreen,0
        mousebind=SUPER,btn_right,moveresize,curresize

        # Axis
        axisbind=SUPER,UP,viewtoleft_have_client
        axisbind=SUPER,DOWN,viewtoright_have_client

        # Layer rules
        layerrule=animation_type_open:zoom,layer_name:noctalia
        layerrule=animation_type_close:zoom,layer_name:noctalia
      '';
    };
  };
}

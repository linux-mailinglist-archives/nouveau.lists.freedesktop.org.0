Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EAD6F3E6
	for <lists+nouveau@lfdr.de>; Sun, 21 Jul 2019 17:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C220289B98;
	Sun, 21 Jul 2019 15:18:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D34AB89B67
 for <nouveau@lists.freedesktop.org>; Sun, 21 Jul 2019 15:18:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CFCA672167; Sun, 21 Jul 2019 15:18:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: nouveau@lists.freedesktop.org
Date: Sun, 21 Jul 2019 15:18:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: xorg
X-Bugzilla-Component: Driver/nouveau
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: hgcoin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: nouveau@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100567-8800-EkFS4464hx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100567-8800@http.bugs.freedesktop.org/>
References: <bug-100567-8800@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Nouveau] [Bug 100567] Nouveau system freeze fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT]
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2079141319=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============2079141319==
Content-Type: multipart/alternative; boundary="15637222805.aFA0BFe.13224"
Content-Transfer-Encoding: 7bit


--15637222805.aFA0BFe.13224
Date: Sun, 21 Jul 2019 15:18:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100567

--- Comment #37 from Harry Coin <hgcoin@gmail.com> ---
Modinfo detail FYI:
modinfo nouveau
filename:=20=20=20=20=20=20
/lib/modules/5.2.0-8-generic/kernel/drivers/gpu/drm/nouveau/nouveau.ko
firmware:       nvidia/gp100/gr/sw_method_init.bin
firmware:       nvidia/gp100/gr/sw_bundle_init.bin
firmware:       nvidia/gp100/gr/sw_nonctx.bin
firmware:       nvidia/gp100/gr/sw_ctx.bin
firmware:       nvidia/gp100/gr/gpccs_sig.bin
firmware:       nvidia/gp100/gr/gpccs_data.bin
firmware:       nvidia/gp100/gr/gpccs_inst.bin
firmware:       nvidia/gp100/gr/gpccs_bl.bin
firmware:       nvidia/gp100/gr/fecs_sig.bin
firmware:       nvidia/gp100/gr/fecs_data.bin
firmware:       nvidia/gp100/gr/fecs_inst.bin
firmware:       nvidia/gp100/gr/fecs_bl.bin
firmware:       nvidia/gp100/acr/ucode_unload.bin
firmware:       nvidia/gp100/acr/ucode_load.bin
firmware:       nvidia/gp100/acr/bl.bin
firmware:       nvidia/gm206/gr/sw_method_init.bin
firmware:       nvidia/gm206/gr/sw_bundle_init.bin
firmware:       nvidia/gm206/gr/sw_nonctx.bin
firmware:       nvidia/gm206/gr/sw_ctx.bin
firmware:       nvidia/gm206/gr/gpccs_sig.bin
firmware:       nvidia/gm206/gr/gpccs_data.bin
firmware:       nvidia/gm206/gr/gpccs_inst.bin
firmware:       nvidia/gm206/gr/gpccs_bl.bin
firmware:       nvidia/gm206/gr/fecs_sig.bin
firmware:       nvidia/gm206/gr/fecs_data.bin
firmware:       nvidia/gm206/gr/fecs_inst.bin
firmware:       nvidia/gm206/gr/fecs_bl.bin
firmware:       nvidia/gm206/acr/ucode_unload.bin
firmware:       nvidia/gm206/acr/ucode_load.bin
firmware:       nvidia/gm206/acr/bl.bin
firmware:       nvidia/gm204/gr/sw_method_init.bin
firmware:       nvidia/gm204/gr/sw_bundle_init.bin
firmware:       nvidia/gm204/gr/sw_nonctx.bin
firmware:       nvidia/gm204/gr/sw_ctx.bin
firmware:       nvidia/gm204/gr/gpccs_sig.bin
firmware:       nvidia/gm204/gr/gpccs_data.bin
firmware:       nvidia/gm204/gr/gpccs_inst.bin
firmware:       nvidia/gm204/gr/gpccs_bl.bin
firmware:       nvidia/gm204/gr/fecs_sig.bin
firmware:       nvidia/gm204/gr/fecs_data.bin
firmware:       nvidia/gm204/gr/fecs_inst.bin
firmware:       nvidia/gm204/gr/fecs_bl.bin
firmware:       nvidia/gm204/acr/ucode_unload.bin
firmware:       nvidia/gm204/acr/ucode_load.bin
firmware:       nvidia/gm204/acr/bl.bin
firmware:       nvidia/gm200/gr/sw_method_init.bin
firmware:       nvidia/gm200/gr/sw_bundle_init.bin
firmware:       nvidia/gm200/gr/sw_nonctx.bin
firmware:       nvidia/gm200/gr/sw_ctx.bin
firmware:       nvidia/gm200/gr/gpccs_sig.bin
firmware:       nvidia/gm200/gr/gpccs_data.bin
firmware:       nvidia/gm200/gr/gpccs_inst.bin
firmware:       nvidia/gm200/gr/gpccs_bl.bin
firmware:       nvidia/gm200/gr/fecs_sig.bin
firmware:       nvidia/gm200/gr/fecs_data.bin
firmware:       nvidia/gm200/gr/fecs_inst.bin
firmware:       nvidia/gm200/gr/fecs_bl.bin
firmware:       nvidia/gm200/acr/ucode_unload.bin
firmware:       nvidia/gm200/acr/ucode_load.bin
firmware:       nvidia/gm200/acr/bl.bin
firmware:       nvidia/gp107/sec2/sig.bin
firmware:       nvidia/gp107/sec2/image.bin
firmware:       nvidia/gp107/sec2/desc.bin
firmware:       nvidia/gp107/nvdec/scrubber.bin
firmware:       nvidia/gp107/gr/sw_method_init.bin
firmware:       nvidia/gp107/gr/sw_bundle_init.bin
firmware:       nvidia/gp107/gr/sw_nonctx.bin
firmware:       nvidia/gp107/gr/sw_ctx.bin
firmware:       nvidia/gp107/gr/gpccs_sig.bin
firmware:       nvidia/gp107/gr/gpccs_data.bin
firmware:       nvidia/gp107/gr/gpccs_inst.bin
firmware:       nvidia/gp107/gr/gpccs_bl.bin
firmware:       nvidia/gp107/gr/fecs_sig.bin
firmware:       nvidia/gp107/gr/fecs_data.bin
firmware:       nvidia/gp107/gr/fecs_inst.bin
firmware:       nvidia/gp107/gr/fecs_bl.bin
firmware:       nvidia/gp107/acr/ucode_unload.bin
firmware:       nvidia/gp107/acr/ucode_load.bin
firmware:       nvidia/gp107/acr/unload_bl.bin
firmware:       nvidia/gp107/acr/bl.bin
firmware:       nvidia/gp106/sec2/sig.bin
firmware:       nvidia/gp106/sec2/image.bin
firmware:       nvidia/gp106/sec2/desc.bin
firmware:       nvidia/gp106/nvdec/scrubber.bin
firmware:       nvidia/gp106/gr/sw_method_init.bin
firmware:       nvidia/gp106/gr/sw_bundle_init.bin
firmware:       nvidia/gp106/gr/sw_nonctx.bin
firmware:       nvidia/gp106/gr/sw_ctx.bin
firmware:       nvidia/gp106/gr/gpccs_sig.bin
firmware:       nvidia/gp106/gr/gpccs_data.bin
firmware:       nvidia/gp106/gr/gpccs_inst.bin
firmware:       nvidia/gp106/gr/gpccs_bl.bin
firmware:       nvidia/gp106/gr/fecs_sig.bin
firmware:       nvidia/gp106/gr/fecs_data.bin
firmware:       nvidia/gp106/gr/fecs_inst.bin
firmware:       nvidia/gp106/gr/fecs_bl.bin
firmware:       nvidia/gp106/acr/ucode_unload.bin
firmware:       nvidia/gp106/acr/ucode_load.bin
firmware:       nvidia/gp106/acr/unload_bl.bin
firmware:       nvidia/gp106/acr/bl.bin
firmware:       nvidia/gp104/sec2/sig.bin
firmware:       nvidia/gp104/sec2/image.bin
firmware:       nvidia/gp104/sec2/desc.bin
firmware:       nvidia/gp104/nvdec/scrubber.bin
firmware:       nvidia/gp104/gr/sw_method_init.bin
firmware:       nvidia/gp104/gr/sw_bundle_init.bin
firmware:       nvidia/gp104/gr/sw_nonctx.bin
firmware:       nvidia/gp104/gr/sw_ctx.bin
firmware:       nvidia/gp104/gr/gpccs_sig.bin
firmware:       nvidia/gp104/gr/gpccs_data.bin
firmware:       nvidia/gp104/gr/gpccs_inst.bin
firmware:       nvidia/gp104/gr/gpccs_bl.bin
firmware:       nvidia/gp104/gr/fecs_sig.bin
firmware:       nvidia/gp104/gr/fecs_data.bin
firmware:       nvidia/gp104/gr/fecs_inst.bin
firmware:       nvidia/gp104/gr/fecs_bl.bin
firmware:       nvidia/gp104/acr/ucode_unload.bin
firmware:       nvidia/gp104/acr/ucode_load.bin
firmware:       nvidia/gp104/acr/unload_bl.bin
firmware:       nvidia/gp104/acr/bl.bin
firmware:       nvidia/gp102/sec2/sig.bin
firmware:       nvidia/gp102/sec2/image.bin
firmware:       nvidia/gp102/sec2/desc.bin
firmware:       nvidia/gp102/nvdec/scrubber.bin
firmware:       nvidia/gp102/gr/sw_method_init.bin
firmware:       nvidia/gp102/gr/sw_bundle_init.bin
firmware:       nvidia/gp102/gr/sw_nonctx.bin
firmware:       nvidia/gp102/gr/sw_ctx.bin
firmware:       nvidia/gp102/gr/gpccs_sig.bin
firmware:       nvidia/gp102/gr/gpccs_data.bin
firmware:       nvidia/gp102/gr/gpccs_inst.bin
firmware:       nvidia/gp102/gr/gpccs_bl.bin
firmware:       nvidia/gp102/gr/fecs_sig.bin
firmware:       nvidia/gp102/gr/fecs_data.bin
firmware:       nvidia/gp102/gr/fecs_inst.bin
firmware:       nvidia/gp102/gr/fecs_bl.bin
firmware:       nvidia/gp102/acr/ucode_unload.bin
firmware:       nvidia/gp102/acr/ucode_load.bin
firmware:       nvidia/gp102/acr/unload_bl.bin
firmware:       nvidia/gp102/acr/bl.bin
firmware:       nvidia/gv100/sec2/sig.bin
firmware:       nvidia/gv100/sec2/image.bin
firmware:       nvidia/gv100/sec2/desc.bin
firmware:       nvidia/gv100/nvdec/scrubber.bin
firmware:       nvidia/gv100/gr/sw_method_init.bin
firmware:       nvidia/gv100/gr/sw_bundle_init.bin
firmware:       nvidia/gv100/gr/sw_nonctx.bin
firmware:       nvidia/gv100/gr/sw_ctx.bin
firmware:       nvidia/gv100/gr/gpccs_sig.bin
firmware:       nvidia/gv100/gr/gpccs_data.bin
firmware:       nvidia/gv100/gr/gpccs_inst.bin
firmware:       nvidia/gv100/gr/gpccs_bl.bin
firmware:       nvidia/gv100/gr/fecs_sig.bin
firmware:       nvidia/gv100/gr/fecs_data.bin
firmware:       nvidia/gv100/gr/fecs_inst.bin
firmware:       nvidia/gv100/gr/fecs_bl.bin
firmware:       nvidia/gv100/acr/ucode_unload.bin
firmware:       nvidia/gv100/acr/ucode_load.bin
firmware:       nvidia/gv100/acr/unload_bl.bin
firmware:       nvidia/gv100/acr/bl.bin
firmware:       nvidia/gp108/sec2/sig.bin
firmware:       nvidia/gp108/sec2/image.bin
firmware:       nvidia/gp108/sec2/desc.bin
firmware:       nvidia/gp108/nvdec/scrubber.bin
firmware:       nvidia/gp108/gr/sw_method_init.bin
firmware:       nvidia/gp108/gr/sw_bundle_init.bin
firmware:       nvidia/gp108/gr/sw_nonctx.bin
firmware:       nvidia/gp108/gr/sw_ctx.bin
firmware:       nvidia/gp108/gr/gpccs_sig.bin
firmware:       nvidia/gp108/gr/gpccs_data.bin
firmware:       nvidia/gp108/gr/gpccs_inst.bin
firmware:       nvidia/gp108/gr/gpccs_bl.bin
firmware:       nvidia/gp108/gr/fecs_sig.bin
firmware:       nvidia/gp108/gr/fecs_data.bin
firmware:       nvidia/gp108/gr/fecs_inst.bin
firmware:       nvidia/gp108/gr/fecs_bl.bin
firmware:       nvidia/gp108/acr/ucode_unload.bin
firmware:       nvidia/gp108/acr/ucode_load.bin
firmware:       nvidia/gp108/acr/unload_bl.bin
firmware:       nvidia/gp108/acr/bl.bin
license:        GPL and additional rights
description:    nVidia Riva/TNT/GeForce/Quadro/Tesla/Tegra K1+
author:         Nouveau Project
srcversion:     4B262C7BE979A671CA04472
alias:          pci:v000012D2d*sv*sd*bc03sc*i*
alias:          pci:v000010DEd*sv*sd*bc03sc*i*
depends:        drm,drm_kms_helper,ttm,mxm-wmi,wmi,video,i2c-algo-bit
retpoline:      Y
intree:         Y
name:           nouveau
vermagic:       5.2.0-8-generic SMP mod_unload=20
sig_id:         PKCS#7
signer:         Build time autogenerated kernel key
sig_key:        30:3F:2C:84:86:2C:9E:8A:2C:77:87:0B:7D:78:6B:32:85:03:0F:C7
sig_hashalgo:   sha512
signature:      10:DE:07:87:76:D7:05:D9:68:48:87:B8:DA:D5:7D:AD:CC:47:FA:3E:
                11:BB:7B:68:FD:4A:02:A3:93:98:D1:C1:06:D0:0C:65:B1:C7:56:16:
                8B:2C:FB:8A:B8:28:93:1F:C7:CA:41:C1:6C:A9:EC:81:44:0D:21:66:
                8D:C9:0F:8C:AB:75:DA:7E:9B:17:71:63:66:DF:52:29:FF:B6:92:35:
                A8:EB:D4:92:4B:E0:4E:B2:12:2F:BB:3C:9A:5B:DE:AA:6D:67:94:06:
                43:44:8D:7D:D5:CC:65:7A:96:36:CA:83:42:6E:C4:CD:DB:2B:4C:D0:
                BD:DF:7B:D9:01:C4:0B:5E:6A:F8:21:E9:D7:10:33:4D:B4:E3:AB:F7:
                CC:85:79:28:7B:C4:F3:1D:B9:E5:53:CE:58:48:2D:3B:CA:0C:1C:83:
                45:94:48:F1:5F:3B:FD:C0:8B:8B:9B:A4:36:45:10:C2:78:F3:FE:3B:
                79:A0:F4:CD:3B:D8:FF:D6:EC:EC:E9:86:FC:F9:C6:AF:FA:68:19:AA:
                89:EC:C8:93:25:DB:FD:9D:F0:62:76:E5:77:98:23:C9:0A:56:7D:B1:
                C4:F9:70:03:30:3D:F7:CB:9A:13:75:7C:96:AD:26:B1:B7:B3:D0:16:
                70:EA:29:9B:85:94:00:E0:FD:06:A1:BF:0B:F5:82:96:CD:99:19:54:
                06:3B:E9:91:BB:15:A3:13:46:15:8B:62:60:8D:EA:E7:4D:B1:20:72:
                E8:99:7A:12:A9:25:97:09:DA:8D:E1:D1:C1:D7:DE:07:4E:2E:9F:F5:
                9C:C3:5A:F3:E0:56:C2:2C:4F:53:48:67:0B:8A:60:37:D0:05:1E:4B:
                6D:F3:05:ED:6B:3F:87:BE:09:E4:66:E5:A0:78:53:04:57:74:54:9E:
                49:12:79:04:AD:04:35:AB:09:04:30:4D:55:5C:6D:A4:1D:8A:B3:73:
                91:1E:A9:B8:AA:F3:1B:48:1F:A0:D4:57:DB:50:D8:FF:82:DC:44:E3:
                55:80:9C:E0:66:AB:F2:64:23:B7:98:C1:A0:42:FA:97:82:B1:1C:39:
                E1:43:D8:1B:7F:7A:85:21:41:C7:D1:84:E1:C7:95:BD:F4:D9:96:9D:
                CF:73:E7:7E:AE:5F:69:6B:1E:3E:9A:E4:B9:37:F9:F1:D0:51:AE:CD:
                5D:7E:FA:3C:C8:81:CB:78:15:7B:B2:88:77:83:55:9D:52:F9:53:1E:
                DF:4D:14:BA:63:33:75:75:98:CB:EC:DC:0A:12:2A:B4:2D:77:0B:90:
                AE:46:76:CA:C0:50:65:91:1C:C4:C8:71:98:B1:A5:EE:57:1F:48:56:
                B7:7A:22:1E:7E:BA:67:05:65:16:09:4E
parm:           vram_pushbuf:Create DMA push buffers in VRAM (int)
parm:           tv_norm:Default TV norm.
                Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,
                        hd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.
                Default: PAL
                *NOTE* Ignored for cards with external TV encoders. (charp)
parm:           nofbaccel:Disable fbcon acceleration (int)
parm:           fbcon_bpp:fbcon bits-per-pixel (default: auto) (int)
parm:           mst:Enable DisplayPort multi-stream (default: enabled) (int)
parm:           tv_disable:Disable TV-out detection (int)
parm:           ignorelid:Ignore ACPI lid status (int)
parm:           duallink:Allow dual-link TMDS (default: enabled) (int)
parm:           hdmimhz:Force a maximum HDMI pixel clock (in MHz) (int)
parm:           config:option string to pass to driver core (charp)
parm:           debug:debug string to pass to driver core (charp)
parm:           noaccel:disable kernel/abi16 acceleration (int)
parm:           modeset:enable driver (default: auto, 0 =3D disabled, 1 =3D
enabled, 2 =3D headless) (int)
parm:           atomic:Expose atomic ioctl (default: disabled) (int)
parm:           runpm:disable (0), force enable (1), optimus only default (=
-1)
(int)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15637222805.aFA0BFe.13224
Date: Sun, 21 Jul 2019 15:18:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567#c37">Comme=
nt # 37</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau system freeze fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT=
]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100567">bug 10056=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hgcoin&#64;gmail.com" title=3D"Harry Coin &lt;hgcoin&#64;gmail.com&gt;"> <s=
pan class=3D"fn">Harry Coin</span></a>
</span></b>
        <pre>Modinfo detail FYI:
modinfo nouveau
filename:=20=20=20=20=20=20
/lib/modules/5.2.0-8-generic/kernel/drivers/gpu/drm/nouveau/nouveau.ko
firmware:       nvidia/gp100/gr/sw_method_init.bin
firmware:       nvidia/gp100/gr/sw_bundle_init.bin
firmware:       nvidia/gp100/gr/sw_nonctx.bin
firmware:       nvidia/gp100/gr/sw_ctx.bin
firmware:       nvidia/gp100/gr/gpccs_sig.bin
firmware:       nvidia/gp100/gr/gpccs_data.bin
firmware:       nvidia/gp100/gr/gpccs_inst.bin
firmware:       nvidia/gp100/gr/gpccs_bl.bin
firmware:       nvidia/gp100/gr/fecs_sig.bin
firmware:       nvidia/gp100/gr/fecs_data.bin
firmware:       nvidia/gp100/gr/fecs_inst.bin
firmware:       nvidia/gp100/gr/fecs_bl.bin
firmware:       nvidia/gp100/acr/ucode_unload.bin
firmware:       nvidia/gp100/acr/ucode_load.bin
firmware:       nvidia/gp100/acr/bl.bin
firmware:       nvidia/gm206/gr/sw_method_init.bin
firmware:       nvidia/gm206/gr/sw_bundle_init.bin
firmware:       nvidia/gm206/gr/sw_nonctx.bin
firmware:       nvidia/gm206/gr/sw_ctx.bin
firmware:       nvidia/gm206/gr/gpccs_sig.bin
firmware:       nvidia/gm206/gr/gpccs_data.bin
firmware:       nvidia/gm206/gr/gpccs_inst.bin
firmware:       nvidia/gm206/gr/gpccs_bl.bin
firmware:       nvidia/gm206/gr/fecs_sig.bin
firmware:       nvidia/gm206/gr/fecs_data.bin
firmware:       nvidia/gm206/gr/fecs_inst.bin
firmware:       nvidia/gm206/gr/fecs_bl.bin
firmware:       nvidia/gm206/acr/ucode_unload.bin
firmware:       nvidia/gm206/acr/ucode_load.bin
firmware:       nvidia/gm206/acr/bl.bin
firmware:       nvidia/gm204/gr/sw_method_init.bin
firmware:       nvidia/gm204/gr/sw_bundle_init.bin
firmware:       nvidia/gm204/gr/sw_nonctx.bin
firmware:       nvidia/gm204/gr/sw_ctx.bin
firmware:       nvidia/gm204/gr/gpccs_sig.bin
firmware:       nvidia/gm204/gr/gpccs_data.bin
firmware:       nvidia/gm204/gr/gpccs_inst.bin
firmware:       nvidia/gm204/gr/gpccs_bl.bin
firmware:       nvidia/gm204/gr/fecs_sig.bin
firmware:       nvidia/gm204/gr/fecs_data.bin
firmware:       nvidia/gm204/gr/fecs_inst.bin
firmware:       nvidia/gm204/gr/fecs_bl.bin
firmware:       nvidia/gm204/acr/ucode_unload.bin
firmware:       nvidia/gm204/acr/ucode_load.bin
firmware:       nvidia/gm204/acr/bl.bin
firmware:       nvidia/gm200/gr/sw_method_init.bin
firmware:       nvidia/gm200/gr/sw_bundle_init.bin
firmware:       nvidia/gm200/gr/sw_nonctx.bin
firmware:       nvidia/gm200/gr/sw_ctx.bin
firmware:       nvidia/gm200/gr/gpccs_sig.bin
firmware:       nvidia/gm200/gr/gpccs_data.bin
firmware:       nvidia/gm200/gr/gpccs_inst.bin
firmware:       nvidia/gm200/gr/gpccs_bl.bin
firmware:       nvidia/gm200/gr/fecs_sig.bin
firmware:       nvidia/gm200/gr/fecs_data.bin
firmware:       nvidia/gm200/gr/fecs_inst.bin
firmware:       nvidia/gm200/gr/fecs_bl.bin
firmware:       nvidia/gm200/acr/ucode_unload.bin
firmware:       nvidia/gm200/acr/ucode_load.bin
firmware:       nvidia/gm200/acr/bl.bin
firmware:       nvidia/gp107/sec2/sig.bin
firmware:       nvidia/gp107/sec2/image.bin
firmware:       nvidia/gp107/sec2/desc.bin
firmware:       nvidia/gp107/nvdec/scrubber.bin
firmware:       nvidia/gp107/gr/sw_method_init.bin
firmware:       nvidia/gp107/gr/sw_bundle_init.bin
firmware:       nvidia/gp107/gr/sw_nonctx.bin
firmware:       nvidia/gp107/gr/sw_ctx.bin
firmware:       nvidia/gp107/gr/gpccs_sig.bin
firmware:       nvidia/gp107/gr/gpccs_data.bin
firmware:       nvidia/gp107/gr/gpccs_inst.bin
firmware:       nvidia/gp107/gr/gpccs_bl.bin
firmware:       nvidia/gp107/gr/fecs_sig.bin
firmware:       nvidia/gp107/gr/fecs_data.bin
firmware:       nvidia/gp107/gr/fecs_inst.bin
firmware:       nvidia/gp107/gr/fecs_bl.bin
firmware:       nvidia/gp107/acr/ucode_unload.bin
firmware:       nvidia/gp107/acr/ucode_load.bin
firmware:       nvidia/gp107/acr/unload_bl.bin
firmware:       nvidia/gp107/acr/bl.bin
firmware:       nvidia/gp106/sec2/sig.bin
firmware:       nvidia/gp106/sec2/image.bin
firmware:       nvidia/gp106/sec2/desc.bin
firmware:       nvidia/gp106/nvdec/scrubber.bin
firmware:       nvidia/gp106/gr/sw_method_init.bin
firmware:       nvidia/gp106/gr/sw_bundle_init.bin
firmware:       nvidia/gp106/gr/sw_nonctx.bin
firmware:       nvidia/gp106/gr/sw_ctx.bin
firmware:       nvidia/gp106/gr/gpccs_sig.bin
firmware:       nvidia/gp106/gr/gpccs_data.bin
firmware:       nvidia/gp106/gr/gpccs_inst.bin
firmware:       nvidia/gp106/gr/gpccs_bl.bin
firmware:       nvidia/gp106/gr/fecs_sig.bin
firmware:       nvidia/gp106/gr/fecs_data.bin
firmware:       nvidia/gp106/gr/fecs_inst.bin
firmware:       nvidia/gp106/gr/fecs_bl.bin
firmware:       nvidia/gp106/acr/ucode_unload.bin
firmware:       nvidia/gp106/acr/ucode_load.bin
firmware:       nvidia/gp106/acr/unload_bl.bin
firmware:       nvidia/gp106/acr/bl.bin
firmware:       nvidia/gp104/sec2/sig.bin
firmware:       nvidia/gp104/sec2/image.bin
firmware:       nvidia/gp104/sec2/desc.bin
firmware:       nvidia/gp104/nvdec/scrubber.bin
firmware:       nvidia/gp104/gr/sw_method_init.bin
firmware:       nvidia/gp104/gr/sw_bundle_init.bin
firmware:       nvidia/gp104/gr/sw_nonctx.bin
firmware:       nvidia/gp104/gr/sw_ctx.bin
firmware:       nvidia/gp104/gr/gpccs_sig.bin
firmware:       nvidia/gp104/gr/gpccs_data.bin
firmware:       nvidia/gp104/gr/gpccs_inst.bin
firmware:       nvidia/gp104/gr/gpccs_bl.bin
firmware:       nvidia/gp104/gr/fecs_sig.bin
firmware:       nvidia/gp104/gr/fecs_data.bin
firmware:       nvidia/gp104/gr/fecs_inst.bin
firmware:       nvidia/gp104/gr/fecs_bl.bin
firmware:       nvidia/gp104/acr/ucode_unload.bin
firmware:       nvidia/gp104/acr/ucode_load.bin
firmware:       nvidia/gp104/acr/unload_bl.bin
firmware:       nvidia/gp104/acr/bl.bin
firmware:       nvidia/gp102/sec2/sig.bin
firmware:       nvidia/gp102/sec2/image.bin
firmware:       nvidia/gp102/sec2/desc.bin
firmware:       nvidia/gp102/nvdec/scrubber.bin
firmware:       nvidia/gp102/gr/sw_method_init.bin
firmware:       nvidia/gp102/gr/sw_bundle_init.bin
firmware:       nvidia/gp102/gr/sw_nonctx.bin
firmware:       nvidia/gp102/gr/sw_ctx.bin
firmware:       nvidia/gp102/gr/gpccs_sig.bin
firmware:       nvidia/gp102/gr/gpccs_data.bin
firmware:       nvidia/gp102/gr/gpccs_inst.bin
firmware:       nvidia/gp102/gr/gpccs_bl.bin
firmware:       nvidia/gp102/gr/fecs_sig.bin
firmware:       nvidia/gp102/gr/fecs_data.bin
firmware:       nvidia/gp102/gr/fecs_inst.bin
firmware:       nvidia/gp102/gr/fecs_bl.bin
firmware:       nvidia/gp102/acr/ucode_unload.bin
firmware:       nvidia/gp102/acr/ucode_load.bin
firmware:       nvidia/gp102/acr/unload_bl.bin
firmware:       nvidia/gp102/acr/bl.bin
firmware:       nvidia/gv100/sec2/sig.bin
firmware:       nvidia/gv100/sec2/image.bin
firmware:       nvidia/gv100/sec2/desc.bin
firmware:       nvidia/gv100/nvdec/scrubber.bin
firmware:       nvidia/gv100/gr/sw_method_init.bin
firmware:       nvidia/gv100/gr/sw_bundle_init.bin
firmware:       nvidia/gv100/gr/sw_nonctx.bin
firmware:       nvidia/gv100/gr/sw_ctx.bin
firmware:       nvidia/gv100/gr/gpccs_sig.bin
firmware:       nvidia/gv100/gr/gpccs_data.bin
firmware:       nvidia/gv100/gr/gpccs_inst.bin
firmware:       nvidia/gv100/gr/gpccs_bl.bin
firmware:       nvidia/gv100/gr/fecs_sig.bin
firmware:       nvidia/gv100/gr/fecs_data.bin
firmware:       nvidia/gv100/gr/fecs_inst.bin
firmware:       nvidia/gv100/gr/fecs_bl.bin
firmware:       nvidia/gv100/acr/ucode_unload.bin
firmware:       nvidia/gv100/acr/ucode_load.bin
firmware:       nvidia/gv100/acr/unload_bl.bin
firmware:       nvidia/gv100/acr/bl.bin
firmware:       nvidia/gp108/sec2/sig.bin
firmware:       nvidia/gp108/sec2/image.bin
firmware:       nvidia/gp108/sec2/desc.bin
firmware:       nvidia/gp108/nvdec/scrubber.bin
firmware:       nvidia/gp108/gr/sw_method_init.bin
firmware:       nvidia/gp108/gr/sw_bundle_init.bin
firmware:       nvidia/gp108/gr/sw_nonctx.bin
firmware:       nvidia/gp108/gr/sw_ctx.bin
firmware:       nvidia/gp108/gr/gpccs_sig.bin
firmware:       nvidia/gp108/gr/gpccs_data.bin
firmware:       nvidia/gp108/gr/gpccs_inst.bin
firmware:       nvidia/gp108/gr/gpccs_bl.bin
firmware:       nvidia/gp108/gr/fecs_sig.bin
firmware:       nvidia/gp108/gr/fecs_data.bin
firmware:       nvidia/gp108/gr/fecs_inst.bin
firmware:       nvidia/gp108/gr/fecs_bl.bin
firmware:       nvidia/gp108/acr/ucode_unload.bin
firmware:       nvidia/gp108/acr/ucode_load.bin
firmware:       nvidia/gp108/acr/unload_bl.bin
firmware:       nvidia/gp108/acr/bl.bin
license:        GPL and additional rights
description:    nVidia Riva/TNT/GeForce/Quadro/Tesla/Tegra K1+
author:         Nouveau Project
srcversion:     4B262C7BE979A671CA04472
alias:          pci:v000012D2d*sv*sd*bc03sc*i*
alias:          pci:v000010DEd*sv*sd*bc03sc*i*
depends:        drm,drm_kms_helper,ttm,mxm-wmi,wmi,video,i2c-algo-bit
retpoline:      Y
intree:         Y
name:           nouveau
vermagic:       5.2.0-8-generic SMP mod_unload=20
sig_id:         PKCS#7
signer:         Build time autogenerated kernel key
sig_key:        30:3F:2C:84:86:2C:9E:8A:2C:77:87:0B:7D:78:6B:32:85:03:0F:C7
sig_hashalgo:   sha512
signature:      10:DE:07:87:76:D7:05:D9:68:48:87:B8:DA:D5:7D:AD:CC:47:FA:3E:
                11:BB:7B:68:FD:4A:02:A3:93:98:D1:C1:06:D0:0C:65:B1:C7:56:16:
                8B:2C:FB:8A:B8:28:93:1F:C7:CA:41:C1:6C:A9:EC:81:44:0D:21:66:
                8D:C9:0F:8C:AB:75:DA:7E:9B:17:71:63:66:DF:52:29:FF:B6:92:35:
                A8:EB:D4:92:4B:E0:4E:B2:12:2F:BB:3C:9A:5B:DE:AA:6D:67:94:06:
                43:44:8D:7D:D5:CC:65:7A:96:36:CA:83:42:6E:C4:CD:DB:2B:4C:D0:
                BD:DF:7B:D9:01:C4:0B:5E:6A:F8:21:E9:D7:10:33:4D:B4:E3:AB:F7:
                CC:85:79:28:7B:C4:F3:1D:B9:E5:53:CE:58:48:2D:3B:CA:0C:1C:83:
                45:94:48:F1:5F:3B:FD:C0:8B:8B:9B:A4:36:45:10:C2:78:F3:FE:3B:
                79:A0:F4:CD:3B:D8:FF:D6:EC:EC:E9:86:FC:F9:C6:AF:FA:68:19:AA:
                89:EC:C8:93:25:DB:FD:9D:F0:62:76:E5:77:98:23:C9:0A:56:7D:B1:
                C4:F9:70:03:30:3D:F7:CB:9A:13:75:7C:96:AD:26:B1:B7:B3:D0:16:
                70:EA:29:9B:85:94:00:E0:FD:06:A1:BF:0B:F5:82:96:CD:99:19:54:
                06:3B:E9:91:BB:15:A3:13:46:15:8B:62:60:8D:EA:E7:4D:B1:20:72:
                E8:99:7A:12:A9:25:97:09:DA:8D:E1:D1:C1:D7:DE:07:4E:2E:9F:F5:
                9C:C3:5A:F3:E0:56:C2:2C:4F:53:48:67:0B:8A:60:37:D0:05:1E:4B:
                6D:F3:05:ED:6B:3F:87:BE:09:E4:66:E5:A0:78:53:04:57:74:54:9E:
                49:12:79:04:AD:04:35:AB:09:04:30:4D:55:5C:6D:A4:1D:8A:B3:73:
                91:1E:A9:B8:AA:F3:1B:48:1F:A0:D4:57:DB:50:D8:FF:82:DC:44:E3:
                55:80:9C:E0:66:AB:F2:64:23:B7:98:C1:A0:42:FA:97:82:B1:1C:39:
                E1:43:D8:1B:7F:7A:85:21:41:C7:D1:84:E1:C7:95:BD:F4:D9:96:9D:
                CF:73:E7:7E:AE:5F:69:6B:1E:3E:9A:E4:B9:37:F9:F1:D0:51:AE:CD:
                5D:7E:FA:3C:C8:81:CB:78:15:7B:B2:88:77:83:55:9D:52:F9:53:1E:
                DF:4D:14:BA:63:33:75:75:98:CB:EC:DC:0A:12:2A:B4:2D:77:0B:90:
                AE:46:76:CA:C0:50:65:91:1C:C4:C8:71:98:B1:A5:EE:57:1F:48:56:
                B7:7A:22:1E:7E:BA:67:05:65:16:09:4E
parm:           vram_pushbuf:Create DMA push buffers in VRAM (int)
parm:           tv_norm:Default TV norm.
                Supported: PAL, PAL-M, PAL-N, PAL-Nc, NTSC-M, NTSC-J,
                        hd480i, hd480p, hd576i, hd576p, hd720p, hd1080i.
                Default: PAL
                *NOTE* Ignored for cards with external TV encoders. (charp)
parm:           nofbaccel:Disable fbcon acceleration (int)
parm:           fbcon_bpp:fbcon bits-per-pixel (default: auto) (int)
parm:           mst:Enable DisplayPort multi-stream (default: enabled) (int)
parm:           tv_disable:Disable TV-out detection (int)
parm:           ignorelid:Ignore ACPI lid status (int)
parm:           duallink:Allow dual-link TMDS (default: enabled) (int)
parm:           hdmimhz:Force a maximum HDMI pixel clock (in MHz) (int)
parm:           config:option string to pass to driver core (charp)
parm:           debug:debug string to pass to driver core (charp)
parm:           noaccel:disable kernel/abi16 acceleration (int)
parm:           modeset:enable driver (default: auto, 0 =3D disabled, 1 =3D
enabled, 2 =3D headless) (int)
parm:           atomic:Expose atomic ioctl (default: disabled) (int)
parm:           runpm:disable (0), force enable (1), optimus only default (=
-1)
(int)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15637222805.aFA0BFe.13224--

--===============2079141319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============2079141319==--

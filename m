Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 702502C8C2A
	for <lists+nouveau@lfdr.de>; Mon, 30 Nov 2020 19:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6D06E7D7;
	Mon, 30 Nov 2020 18:08:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60119.outbound.protection.outlook.com [40.107.6.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F1F6E4B6
 for <nouveau@lists.freedesktop.org>; Mon, 30 Nov 2020 15:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFbnxtKJ7XAnemkWDutTNN62eWhO8dJf2K9V7tzyR1cwR8ILKMfu34XxJClycwntudFA6SEoi3rq6JNHdTfLWLAC0Bbu37ZIFeq22AAQyca/0QDn1/kcpRUEZWmV31+f3TjxYV3Jc+JylPNaTSSGUsT1ijNfhJOtyR1rzJ+jhiYMeeCBR9XaoIbMySrzx6riZ7lm22qmB5K4p1pbGmzsQONScGXWf23U/dxmjfnPi2A8UTG0qSKkdNijRy793ENoV3WdNE2S2ZIaj1Vc0Qx2bMIjMYjSOFU7axcxBnwlaIpbwlIz9hxWuW94ZG/ze9EUwUO3BsiI2ixozwvfQ6ZGqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UfDFd7XDs+sOAULz3I7t6R5oBUch50I/nvabibcuJI=;
 b=mCejhOjMU2YY3XPjkIB/XxtrKmDw6A94IVlPpEn4qKpwbpeFs0WYTwvNZXFAcZLjUda1akhvDvGCfDoofGLwJqvUn/n0+omJxWMbRfXDaWdrhCmdK2taEQqS1WqqiHKvK+FEsaEaBrbGlbw4yjKIfw8HOGJS8sssyAUMuDYRaqVyzuMhQCbgHS0v90ubb5ggU6RYZSJt8EBrJmNxg0e+bm/TqM16uqEWZROUJDdKwZY4G0OqypQN39qKrHv1KfiTj//PiiXcr5hELmuLPLNkZBcv2zNHAUUNLsS3RW/I+I2qhMKAMhbQsz33b9OLW4gXV8KJ8WVbBZaqPHLN6kJrYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
 is 192.38.125.140)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=di.ku.dk; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=di.ku.dk; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=di.ku.dk; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UfDFd7XDs+sOAULz3I7t6R5oBUch50I/nvabibcuJI=;
 b=UTcWtxLpwXxfCU7r5bK2C0UUcJGWg8m7Pq+SyTGGca0X5ZgeOMuY1QeZPAgsxtyBDRU1XdORyrZVCaUjoIsWT9A0zwcj8S7/xGZUtnZ3igSgDnuWmTldYGkEY1KX47xysj6el21i6AWxiB9L3tzVGEhG4nVWgsVck59U+FgCInM=
Received: from AM7PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:20b:110::22)
 by DB8PR04MB6604.eurprd04.prod.outlook.com (2603:10a6:10:105::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 15:27:22 +0000
Received: from VE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::b4) by AM7PR04CA0012.outlook.office365.com
 (2603:10a6:20b:110::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Mon, 30 Nov 2020 15:27:22 +0000
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is
 192.38.125.140) smtp.mailfrom=di.ku.dk; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=di.ku.dk;
Received-SPF: PermError (protection.outlook.com: domain of di.ku.dk used an
 invalid SPF mechanism)
Received: from mailedg02pw.ku.dk (192.38.125.140) by
 VE1EUR02FT042.mail.protection.outlook.com (10.152.13.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.23 via Frontend Transport; Mon, 30 Nov 2020 15:27:22 +0000
Received: from sepo4.ku.dk (10.78.8.10) by MAILEDG02PW.unicph.domain
 (192.38.125.140) with Microsoft SMTP Server id 15.1.2106.2; Mon, 30 Nov 2020
 16:26:26 +0100
Received: from 10.78.0.165 ([10.78.0.165])
 by sepo4.ku.dk (JAMES SMTP Server 2.3.2-1) with SMTP ID 767;
 Mon, 30 Nov 2020 16:26:26 +0100 (CET)
Received: from MAILMBX06PW.unicph.domain (10.77.128.235) by
 MAILMBX09PW.unicph.domain (10.77.0.237) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 30 Nov 2020 16:26:25 +0100
Received: from MAILMBX06PW.unicph.domain ([fe80::b490:978e:6124:2a5c]) by
 MAILMBX06PW.unicph.domain ([fe80::b490:978e:6124:2a5c%6]) with mapi id
 15.01.2106.004; Mon, 30 Nov 2020 16:26:25 +0100
From: Klaus Ebbe Grue <grue@di.ku.dk>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Thread-Topic: [Nouveau] Could Fedora-5.9.9/X-server problem be a
 Nouveau-problem?
Thread-Index: AQHWxlD2xLL8tgVWbEyZw6VXVXLananfqVaAgAEiW7U=
Date: Mon, 30 Nov 2020 15:26:25 +0000
Message-ID: <45fcac9dfcd54c20873427cc5042aeb4@di.ku.dk>
References: <f827ab7dd91e4b1684dd818bd541272d@di.ku.dk>,
 <CAKb7UvjiRApxVzxT=9Y26uXWB3zDMf8Nvi+eHfE0yJUMAfGLog@mail.gmail.com>
In-Reply-To: <CAKb7UvjiRApxVzxT=9Y26uXWB3zDMf8Nvi+eHfE0yJUMAfGLog@mail.gmail.com>
Accept-Language: da-DK, en-US
Content-Language: da-DK
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.78.8.10]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93b3ae46-6211-424d-9acb-08d895446f0b
X-MS-TrafficTypeDiagnostic: DB8PR04MB6604:
X-Microsoft-Antispam-PRVS: <DB8PR04MB660421920F985790C64A2B99E3F50@DB8PR04MB6604.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v2zLMVi2M8EopjYhmAq5F6HntRY9eqDsK0v1MUWYORrxYeixcs0xgEvxcr55mB1AVv10Bv/TydD3jsT5d6DQsmnJK9fQmy+RsIuyHwSiK57vFTbCxHOlsxFTK/OaskBftHHk0gFk0NMKagk1Fhs0lN6pLUdEjbuvl4tetDBTlC4isA9Kv7oWiunmGK65m6KPr3mb32tunhFGjvrpZ0NCvEiRdTYagKkJDXtZ+9CXfKZsRbZl/Fl5UM0yfnj5emA72nYb1XhPuUBZffReYXUy+aTS+ETf257gOx+P9oCnfqBJT/ka1vDZZvl2wFFfJ5f5PNwL63boMgPfI3Dqxeaem53xrKHnyS5BG+ZE0dHoUU0K1GeyFlpoYKKFo9tst/bMdmUIpNyabfi8Do0K+vwBSUe0c/1tZE1KlfjfC7ZOa3JHJAVZtT6WKzZwasVNwFV9EUvOkgdZagVJ0fINHteDOfVIrBy1z9zOK7JZspPLL1Y=
X-Forefront-Antispam-Report: CIP:192.38.125.140; CTRY:DK; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mailedg02pw.ku.dk; PTR:mailedg02pw.ku.dk; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966005)(478600001)(7596003)(7636003)(356005)(966005)(47076004)(30864003)(70206006)(70586007)(82740400003)(2906002)(5660300002)(45080400002)(336012)(186003)(24736004)(108616005)(26005)(19627235002)(53546011)(786003)(316002)(54906003)(36756003)(86362001)(2616005)(6916009)(8936002)(8676002)(82310400003)(4326008)(83380400001)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: di.ku.dk
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2020 15:27:22.5102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b3ae46-6211-424d-9acb-08d895446f0b
X-MS-Exchange-CrossTenant-Id: a3927f91-cda1-4696-af89-8c9f1ceffa91
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a3927f91-cda1-4696-af89-8c9f1ceffa91; Ip=[192.38.125.140];
 Helo=[mailedg02pw.ku.dk]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR02FT042.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6604
X-Mailman-Approved-At: Mon, 30 Nov 2020 18:08:01 +0000
Subject: Re: [Nouveau] Could Fedora-5.9.9/X-server problem be a
 Nouveau-problem?
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Ilia

Thanks.

> Klaus -- please supply a full Xorg log.

I have included Xorg.0.log.old (X server fails on Fedora 5.9.9) and Xorg.0.log (X server succeeds on Fedora 5.8.18).

Cheers,
Klaus

---

Xorg.0.log.old (X server fails on Fedora 5.9.9)

[    11.073] 
X.Org X Server 1.20.9
X Protocol Version 11, Revision 0
[    11.073] Build Operating System:  5.8.7-200.fc32.x86_64 
[    11.073] Current Operating System: Linux thor 5.9.9-200.fc33.x86_64 #1 SMP Thu Nov 19 21:25:45 UTC 2020 x86_64
[    11.074] Kernel command line: BOOT_IMAGE=(hd0,gpt6)/vmlinuz-5.9.9-200.fc33.x86_64 root=/dev/mapper/fedora-root ro rd.lvm.lv=fedora/root rd.lvm.lv=fedora/swap rhgb quiet
[    11.074] Build Date: 08 October 2020  12:00:00AM
[    11.074] Build ID: xorg-x11-server 1.20.9-1.fc33 
[    11.074] Current version of pixman: 0.40.0
[    11.074] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[    11.074] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    11.074] (==) Log file: "/var/log/Xorg.0.log", Time: Mon Nov 30 16:13:30 2020
[    11.074] (==) Using config directory: "/etc/X11/xorg.conf.d"
[    11.074] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    11.076] (==) No Layout section.  Using the first Screen section.
[    11.076] (==) No screen section available. Using defaults.
[    11.076] (**) |-->Screen "Default Screen Section" (0)
[    11.076] (**) |   |-->Monitor "<default monitor>"
[    11.076] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[    11.076] (==) Automatically adding devices
[    11.076] (==) Automatically enabling devices
[    11.076] (==) Automatically adding GPU devices
[    11.076] (==) Automatically binding GPU devices
[    11.076] (==) Max clients allowed: 256, resource mask: 0x1fffff
[    11.076] (==) FontPath set to:
	catalogue:/etc/X11/fontpath.d,
	built-ins
[    11.076] (==) ModulePath set to "/usr/lib64/xorg/modules"
[    11.076] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[    11.076] (II) Loader magic: 0x55af7a583b20
[    11.076] (II) Module ABI versions:
[    11.076] 	X.Org ANSI C Emulation: 0.4
[    11.076] 	X.Org Video Driver: 24.1
[    11.076] 	X.Org XInput driver : 24.1
[    11.076] 	X.Org Server Extension : 10.0
[    11.076] (++) using VT number 1

[    11.076] (II) systemd-logind: logind integration requires -keeptty and -keeptty was not provided, disabling logind integration
[    11.077] (II) xfree86: Adding drm device (/dev/dri/card0)
[    11.078] (--) PCI:*(1@0:0:0) 10de:1b82:1043:861e rev 161, Mem @ 0xf6000000/16777216, 0xe0000000/268435456, 0xf0000000/33554432, I/O @ 0x0000e000/128, BIOS @ 0x????????/131072
[    11.078] (II) LoadModule: "glx"
[    11.079] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[    11.084] (II) Module glx: vendor="X.Org Foundation"
[    11.084] 	compiled for 1.20.9, module version = 1.0.0
[    11.084] 	ABI class: X.Org Server Extension, version 10.0
[    11.192] (==) Matched modesetting as autoconfigured driver 0
[    11.192] (==) Matched fbdev as autoconfigured driver 1
[    11.192] (==) Matched vesa as autoconfigured driver 2
[    11.192] (==) Assigned the driver to the xf86ConfigLayout
[    11.192] (II) LoadModule: "modesetting"
[    11.192] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[    11.193] (II) Module modesetting: vendor="X.Org Foundation"
[    11.193] 	compiled for 1.20.9, module version = 1.20.9
[    11.193] 	Module class: X.Org Video Driver
[    11.193] 	ABI class: X.Org Video Driver, version 24.1
[    11.193] (II) LoadModule: "fbdev"
[    11.193] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[    11.193] (II) Module fbdev: vendor="X.Org Foundation"
[    11.193] 	compiled for 1.20.8, module version = 0.5.0
[    11.193] 	Module class: X.Org Video Driver
[    11.193] 	ABI class: X.Org Video Driver, version 24.1
[    11.193] (II) LoadModule: "vesa"
[    11.193] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[    11.194] (II) Module vesa: vendor="X.Org Foundation"
[    11.194] 	compiled for 1.20.8, module version = 2.4.0
[    11.194] 	Module class: X.Org Video Driver
[    11.194] 	ABI class: X.Org Video Driver, version 24.1
[    11.194] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    11.194] (II) FBDEV: driver for framebuffer: fbdev
[    11.194] (II) VESA: driver for VESA chipsets: vesa
[    11.194] (II) modeset(0): using drv /dev/dri/card0
[    11.194] (WW) Falling back to old probe method for fbdev
[    11.194] (II) Loading sub module "fbdevhw"
[    11.194] (II) LoadModule: "fbdevhw"
[    11.194] (II) Loading /usr/lib64/xorg/modules/libfbdevhw.so
[    11.195] (II) Module fbdevhw: vendor="X.Org Foundation"
[    11.195] 	compiled for 1.20.9, module version = 0.0.2
[    11.195] 	ABI class: X.Org Video Driver, version 24.1
[    11.195] (II) modeset(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[    11.195] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
[    11.195] (==) modeset(0): RGB weight 888
[    11.195] (==) modeset(0): Default visual is TrueColor
[    11.195] (II) Loading sub module "glamoregl"
[    11.195] (II) LoadModule: "glamoregl"
[    11.195] (II) Loading /usr/lib64/xorg/modules/libglamoregl.so
[    11.200] (II) Module glamoregl: vendor="X.Org Foundation"
[    11.200] 	compiled for 1.20.9, module version = 1.0.1
[    11.200] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    11.424] (II) modeset(0): glamor X acceleration enabled on NV134
[    11.424] (II) modeset(0): glamor initialized
[    11.425] (II) modeset(0): Output DVI-D-1 has no monitor section
[    11.468] (II) modeset(0): Output DP-1 has no monitor section
[    11.500] (II) modeset(0): Output DP-2 has no monitor section
[    11.501] (II) modeset(0): Output HDMI-1 has no monitor section
[    11.502] (II) modeset(0): Output HDMI-2 has no monitor section
[    11.504] (II) modeset(0): EDID for output DVI-D-1
[    11.547] (II) modeset(0): EDID for output DP-1
[    11.547] (II) modeset(0): Manufacturer: PHL  Model: 8fa  Serial#: 6913
[    11.547] (II) modeset(0): Year: 2017  Week: 43
[    11.547] (II) modeset(0): EDID Version: 1.4
[    11.547] (II) modeset(0): Digital Display Input
[    11.547] (II) modeset(0): 10 bits per channel
[    11.547] (II) modeset(0): Digital interface is DisplayPort
[    11.547] (II) modeset(0): Max Image Size [cm]: horiz.: 95  vert.: 54
[    11.547] (II) modeset(0): Gamma: 2.20
[    11.547] (II) modeset(0): DPMS capabilities: Off
[    11.547] (II) modeset(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 YCrCb 4:2:2
[    11.547] (II) modeset(0): First detailed timing is preferred mode
[    11.547] (II) modeset(0): Preferred mode is native pixel format and refresh rate
[    11.547] (II) modeset(0): redX: 0.646 redY: 0.333   greenX: 0.326 greenY: 0.609
[    11.547] (II) modeset(0): blueX: 0.145 blueY: 0.050   whiteX: 0.280 whiteY: 0.290
[    11.547] (II) modeset(0): Supported established timings:
[    11.547] (II) modeset(0): 720x400@70Hz
[    11.547] (II) modeset(0): 640x480@60Hz
[    11.547] (II) modeset(0): 640x480@67Hz
[    11.547] (II) modeset(0): 640x480@72Hz
[    11.547] (II) modeset(0): 640x480@75Hz
[    11.547] (II) modeset(0): 800x600@56Hz
[    11.547] (II) modeset(0): 800x600@60Hz
[    11.547] (II) modeset(0): 800x600@72Hz
[    11.547] (II) modeset(0): 800x600@75Hz
[    11.547] (II) modeset(0): 832x624@75Hz
[    11.547] (II) modeset(0): 1024x768@60Hz
[    11.547] (II) modeset(0): 1024x768@70Hz
[    11.547] (II) modeset(0): 1024x768@75Hz
[    11.547] (II) modeset(0): 1280x1024@75Hz
[    11.547] (II) modeset(0): Manufacturer's mask: 0
[    11.547] (II) modeset(0): Supported standard timings:
[    11.547] (II) modeset(0): #0: hsize: 1920  vsize 1080  refresh: 60  vid: 49361
[    11.547] (II) modeset(0): #1: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[    11.547] (II) modeset(0): #2: hsize: 1440  vsize 900  refresh: 60  vid: 149
[    11.547] (II) modeset(0): #3: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[    11.547] (II) modeset(0): #4: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[    11.547] (II) modeset(0): #5: hsize: 1280  vsize 720  refresh: 60  vid: 49281
[    11.547] (II) modeset(0): Supported detailed timing:
[    11.547] (II) modeset(0): clock: 533.2 MHz   Image Size:  953 x 543 mm
[    11.547] (II) modeset(0): h_active: 3840  h_sync: 3888  h_sync_end 3920 h_blank_end 4000 h_border: 0
[    11.547] (II) modeset(0): v_active: 2160  v_sync: 2163  v_sync_end 2168 v_blanking: 2222 v_border: 0
[    11.547] (II) modeset(0): Supported detailed timing:
[    11.547] (II) modeset(0): clock: 241.5 MHz   Image Size:  953 x 543 mm
[    11.547] (II) modeset(0): h_active: 2560  h_sync: 2608  h_sync_end 2640 h_blank_end 2720 h_border: 0
[    11.547] (II) modeset(0): v_active: 1440  v_sync: 1443  v_sync_end 1448 v_blanking: 1481 v_border: 0
[    11.547] (II) modeset(0): Ranges: V min: 23 V max: 80 Hz, H min: 30 H max: 160 kHz, PixClock max 605 MHz
[    11.547] (II) modeset(0): Monitor name: PHL BDM4350
[    11.548] (II) modeset(0): Supported detailed timing:
[    11.548] (II) modeset(0): clock: 74.2 MHz   Image Size:  953 x 543 mm
[    11.548] (II) modeset(0): h_active: 1280  h_sync: 1390  h_sync_end 1430 h_blank_end 1650 h_border: 0
[    11.548] (II) modeset(0): v_active: 720  v_sync: 725  v_sync_end 730 v_blanking: 750 v_border: 0
[    11.548] (II) modeset(0): Supported detailed timing:
[    11.548] (II) modeset(0): clock: 27.0 MHz   Image Size:  953 x 543 mm
[    11.548] (II) modeset(0): h_active: 720  h_sync: 736  h_sync_end 798 h_blank_end 858 h_border: 0
[    11.548] (II) modeset(0): v_active: 480  v_sync: 489  v_sync_end 495 v_blanking: 525 v_border: 0
[    11.548] (II) modeset(0): Supported detailed timing:
[    11.548] (II) modeset(0): clock: 27.0 MHz   Image Size:  953 x 543 mm
[    11.548] (II) modeset(0): h_active: 720  h_sync: 732  h_sync_end 796 h_blank_end 864 h_border: 0
[    11.548] (II) modeset(0): v_active: 576  v_sync: 581  v_sync_end 586 v_blanking: 625 v_border: 0
[    11.548] (II) modeset(0): Supported detailed timing:
[    11.548] (II) modeset(0): clock: 277.2 MHz   Image Size:  953 x 543 mm
[    11.548] (II) modeset(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[    11.548] (II) modeset(0): v_active: 2160  v_sync: 2163  v_sync_end 2173 v_blanking: 2222 v_border: 0
[    11.548] (II) modeset(0): Number of EDID sections to follow: 1
[    11.548] (II) modeset(0): EDID (in hex):
[    11.548] (II) modeset(0): 	00ffffffffffff00410cfa08011b0000
[    11.548] (II) modeset(0): 	2b1b0104b55f36783a583da555539c25
[    11.548] (II) modeset(0): 	0c474abfef00d1c0b300950081808140
[    11.548] (II) modeset(0): 	81c0010101014dd000a0f0703e803020
[    11.548] (II) modeset(0): 	3500b91f3200001a565e00a0a0a02950
[    11.548] (II) modeset(0): 	30203500b91f3200001e000000fd0017
[    11.548] (II) modeset(0): 	501ea03c010a202020202020000000fc
[    11.548] (II) modeset(0): 	0050484c2042444d343335300a200155
[    11.548] (II) modeset(0): 	020326f14b0103051404131f12021190
[    11.548] (II) modeset(0): 	23090707830100006d030c0010001878
[    11.548] (II) modeset(0): 	200060010203011d007251d01e206e28
[    11.548] (II) modeset(0): 	5500b91f3200001e8c0ad08a20e02d10
[    11.548] (II) modeset(0): 	103e9600b91f320000188c0ad0902040
[    11.548] (II) modeset(0): 	31200c405500b91f320000184d6c80a0
[    11.548] (II) modeset(0): 	70703e8030203a00b91f3200001a0000
[    11.548] (II) modeset(0): 	0000000000000000000000000000006d
[    11.548] (--) modeset(0): HDMI max TMDS frequency 600000KHz
[    11.548] (II) modeset(0): Not using default mode "2560x1440" (bad mode clock/interlace/doublescan)
[    11.548] (II) modeset(0): Printing probed modes for output DP-1
[    11.548] (II) modeset(0): Modeline "1920x2160"x60.0  277.25  1920 1968 2000 2080  2160 2163 2173 2222 +hsync -vsync (133.3 kHz e)
[    11.548] (II) modeset(0): Modeline "2560x1600"x60.0  348.50  2560 2760 3032 3504  1600 1603 1609 1658 -hsync +vsync (99.5 kHz d)
[    11.548] (II) modeset(0): Modeline "2560x1600"x60.0  268.50  2560 2608 2640 2720  1600 1603 1609 1646 +hsync -vsync (98.7 kHz d)
[    11.548] (II) modeset(0): Modeline "2560x1440"x60.0  469.12  2560 2584 2600 2640  1440 1441 1444 1481 doublescan +hsync -vsync (177.7 kHz d)
[    11.548] (II) modeset(0): Modeline "2560x1440"x60.0  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync (89.5 kHz d)
[    11.548] (II) modeset(0): Modeline "2560x1440"x60.0  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync +vsync (88.8 kHz e)
[    11.548] (II) modeset(0): Modeline "2560x1440"x60.0  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz d)
[    11.548] (II) modeset(0): Modeline "2048x1536"x75.0  340.48  2048 2216 2440 2832  1536 1537 1540 1603 -hsync +vsync (120.2 kHz d)
[    11.548] (II) modeset(0): Modeline "2048x1536"x60.0  266.95  2048 2200 2424 2800  1536 1537 1540 1589 -hsync +vsync (95.3 kHz d)
[    11.548] (II) modeset(0): Modeline "1920x1440"x75.0  297.00  1920 2064 2288 2640  1440 1441 1444 1500 -hsync +vsync (112.5 kHz d)
[    11.548] (II) modeset(0): Modeline "1920x1440"x60.0  234.00  1920 2048 2256 2600  1440 1441 1444 1500 -hsync +vsync (90.0 kHz d)
[    11.548] (II) modeset(0): Modeline "1856x1392"x75.0  288.00  1856 1984 2208 2560  1392 1393 1396 1500 -hsync +vsync (112.5 kHz d)
[    11.548] (II) modeset(0): Modeline "1856x1392"x60.0  218.30  1856 1952 2176 2528  1392 1393 1396 1439 -hsync +vsync (86.4 kHz d)
[    11.548] (II) modeset(0): Modeline "1792x1344"x75.0  261.00  1792 1888 2104 2456  1344 1345 1348 1417 -hsync +vsync (106.3 kHz d)
[    11.548] (II) modeset(0): Modeline "1792x1344"x60.0  204.80  1792 1920 2120 2448  1344 1345 1348 1394 -hsync +vsync (83.7 kHz d)
[    11.548] (II) modeset(0): Modeline "2048x1152"x60.0  406.50  2048 2220 2444 2840  1152 1153 1156 1193 doublescan -hsync +vsync (143.1 kHz d)
[    11.548] (II) modeset(0): Modeline "2048x1152"x60.0  302.50  2048 2072 2088 2128  1152 1153 1156 1185 doublescan +hsync -vsync (142.2 kHz d)
[    11.548] (II) modeset(0): Modeline "2048x1152"x59.9  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync (71.6 kHz d)
[    11.548] (II) modeset(0): Modeline "2048x1152"x59.9  156.75  2048 2096 2128 2208  1152 1155 1160 1185 +hsync -vsync (71.0 kHz d)
[    11.548] (II) modeset(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz d)
[    11.548] (II) modeset(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz d)
[    11.548] (II) modeset(0): Modeline "1920x1080"x60.0  356.38  1920 2080 2288 2656  1080 1081 1084 1118 doublescan -hsync +vsync (134.2 kHz d)
[    11.548] (II) modeset(0): Modeline "1920x1080"x60.0  266.50  1920 1944 1960 2000  1080 1081 1084 1111 doublescan +hsync -vsync (133.2 kHz d)
[    11.548] (II) modeset(0): Modeline "1920x1080"x60.0  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync (67.2 kHz d)
[    11.548] (II) modeset(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 -hsync -vsync (67.5 kHz e)
[    11.548] (II) modeset(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[    11.548] (II) modeset(0): Modeline "1920x1080"x50.0  148.50  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[    11.548] (II) modeset(0): Modeline "1920x1080"x59.9  148.35  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.4 kHz e)
[    11.548] (II) modeset(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz d)
[    11.548] (II) modeset(0): Modeline "1600x1200"x75.0  202.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (93.8 kHz d)
[    11.548] (II) modeset(0): Modeline "1600x1200"x70.0  189.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (87.5 kHz d)
[    11.548] (II) modeset(0): Modeline "1600x1200"x65.0  175.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (81.2 kHz d)
[    11.548] (II) modeset(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz d)
[    11.548] (II) modeset(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz e)
[    11.548] (II) modeset(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz d)
[    11.548] (II) modeset(0): Modeline "1400x1050"x74.8  155.80  1400 1464 1784 1912  1050 1052 1064 1090 +hsync +vsync (81.5 kHz d)
[    11.548] (II) modeset(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880  1050 1052 1064 1082 +hsync +vsync (64.9 kHz d)
[    11.548] (II) modeset(0): Modeline "1600x900"x60.0  246.00  1600 1728 1900 2200  900 901 904 932 doublescan -hsync +vsync (111.8 kHz d)
[    11.548] (II) modeset(0): Modeline "1600x900"x59.9  186.50  1600 1624 1640 1680  900 901 904 926 doublescan +hsync -vsync (111.0 kHz d)
[    11.548] (II) modeset(0): Modeline "1600x900"x59.9  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync (56.0 kHz d)
[    11.548] (II) modeset(0): Modeline "1600x900"x59.8   97.50  1600 1648 1680 1760  900 903 908 926 +hsync -vsync (55.4 kHz d)
[    11.548] (II) modeset(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    11.548] (II) modeset(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    11.548] (II) modeset(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz e)
[    11.548] (II) modeset(0): Modeline "1400x900"x60.0  103.50  1400 1480 1624 1848  900 903 913 934 -hsync +vsync (56.0 kHz d)
[    11.548] (II) modeset(0): Modeline "1400x900"x59.9   86.50  1400 1448 1480 1560  900 903 913 926 +hsync -vsync (55.4 kHz d)
[    11.548] (II) modeset(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    11.548] (II) modeset(0): Modeline "1440x810"x60.0  198.12  1440 1548 1704 1968  810 811 814 839 doublescan -hsync +vsync (100.7 kHz d)
[    11.548] (II) modeset(0): Modeline "1440x810"x60.0  151.88  1440 1464 1480 1520  810 811 814 833 doublescan +hsync -vsync (99.9 kHz d)
[    11.548] (II) modeset(0): Modeline "1368x768"x59.9   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync (47.8 kHz d)
[    11.548] (II) modeset(0): Modeline "1368x768"x59.9   72.25  1368 1416 1448 1528  768 771 781 790 +hsync -vsync (47.3 kHz d)
[    11.548] (II) modeset(0): Modeline "1280x800"x60.0  174.25  1280 1380 1516 1752  800 801 804 829 doublescan -hsync +vsync (99.5 kHz d)
[    11.548] (II) modeset(0): Modeline "1280x800"x60.0  134.25  1280 1304 1320 1360  800 801 804 823 doublescan +hsync -vsync (98.7 kHz d)
[    11.548] (II) modeset(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 -hsync +vsync (49.7 kHz d)
[    11.548] (II) modeset(0): Modeline "1280x800"x59.9   71.00  1280 1328 1360 1440  800 803 809 823 +hsync -vsync (49.3 kHz d)
[    11.548] (II) modeset(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz d)
[    11.548] (II) modeset(0): Modeline "1280x720"x60.0  156.12  1280 1376 1512 1744  720 721 724 746 doublescan -hsync +vsync (89.5 kHz d)
[    11.548] (II) modeset(0): Modeline "1280x720"x60.0  120.75  1280 1304 1320 1360  720 721 724 740 doublescan +hsync -vsync (88.8 kHz d)
[    11.548] (II) modeset(0): Modeline "1280x720"x59.9   74.50  1280 1344 1472 1664  720 723 728 748 -hsync +vsync (44.8 kHz d)
[    11.548] (II) modeset(0): Modeline "1280x720"x60.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    11.548] (II) modeset(0): Modeline "1280x720"x50.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    11.548] (II) modeset(0): Modeline "1280x720"x59.9   74.18  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    11.548] (II) modeset(0): Modeline "1280x720"x59.7   63.75  1280 1328 1360 1440  720 723 728 741 +hsync -vsync (44.3 kHz d)
[    11.548] (II) modeset(0): Modeline "1024x768"x75.0  170.24  1024 1108 1220 1416  768 768 770 801 doublescan -hsync +vsync (120.2 kHz d)
[    11.548] (II) modeset(0): Modeline "1024x768"x60.0  133.47  1024 1100 1212 1400  768 768 770 794 doublescan -hsync +vsync (95.3 kHz d)
[    11.548] (II) modeset(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    11.548] (II) modeset(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    11.548] (II) modeset(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    11.548] (II) modeset(0): Modeline "960x720"x75.0  148.50  960 1032 1144 1320  720 720 722 750 doublescan -hsync +vsync (112.5 kHz d)
[    11.548] (II) modeset(0): Modeline "960x720"x60.0  117.00  960 1024 1128 1300  720 720 722 750 doublescan -hsync +vsync (90.0 kHz d)
[    11.548] (II) modeset(0): Modeline "928x696"x75.0  144.00  928 992 1104 1280  696 696 698 750 doublescan -hsync +vsync (112.5 kHz d)
[    11.548] (II) modeset(0): Modeline "928x696"x60.1  109.15  928 976 1088 1264  696 696 698 719 doublescan -hsync +vsync (86.4 kHz d)
[    11.548] (II) modeset(0): Modeline "896x672"x75.0  130.50  896 944 1052 1228  672 672 674 708 doublescan -hsync +vsync (106.3 kHz d)
[    11.548] (II) modeset(0): Modeline "896x672"x60.0  102.40  896 960 1060 1224  672 672 674 697 doublescan -hsync +vsync (83.7 kHz d)
[    11.548] (II) modeset(0): Modeline "1024x576"x60.0   98.50  1024 1092 1200 1376  576 577 580 597 doublescan -hsync +vsync (71.6 kHz d)
[    11.548] (II) modeset(0): Modeline "1024x576"x60.0   78.38  1024 1048 1064 1104  576 577 580 592 doublescan +hsync -vsync (71.0 kHz d)
[    11.548] (II) modeset(0): Modeline "1024x576"x59.9   46.50  1024 1064 1160 1296  576 579 584 599 -hsync +vsync (35.9 kHz d)
[    11.548] (II) modeset(0): Modeline "1024x576"x59.8   42.00  1024 1072 1104 1184  576 579 584 593 +hsync -vsync (35.5 kHz d)
[    11.548] (II) modeset(0): Modeline "960x600"x59.9   96.62  960 1028 1128 1296  600 601 604 622 doublescan -hsync +vsync (74.6 kHz d)
[    11.548] (II) modeset(0): Modeline "960x600"x60.0   77.00  960 984 1000 1040  600 601 604 617 doublescan +hsync -vsync (74.0 kHz d)
[    11.548] (II) modeset(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[    11.548] (II) modeset(0): Modeline "960x540"x60.0   86.50  960 1024 1124 1288  540 541 544 560 doublescan -hsync +vsync (67.2 kHz d)
[    11.548] (II) modeset(0): Modeline "960x540"x60.0   69.25  960 984 1000 1040  540 541 544 555 doublescan +hsync -vsync (66.6 kHz d)
[    11.548] (II) modeset(0): Modeline "960x540"x59.6   40.75  960 992 1088 1216  540 543 548 562 -hsync +vsync (33.5 kHz d)
[    11.548] (II) modeset(0): Modeline "960x540"x59.8   37.25  960 1008 1040 1120  540 543 548 556 +hsync -vsync (33.3 kHz d)
[    11.548] (II) modeset(0): Modeline "800x600"x75.0  101.25  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (93.8 kHz d)
[    11.548] (II) modeset(0): Modeline "800x600"x70.0   94.50  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (87.5 kHz d)
[    11.548] (II) modeset(0): Modeline "800x600"x65.0   87.75  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (81.2 kHz d)
[    11.548] (II) modeset(0): Modeline "800x600"x60.0   81.00  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (75.0 kHz d)
[    11.548] (II) modeset(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[    11.548] (II) modeset(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    11.548] (II) modeset(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    11.548] (II) modeset(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    11.548] (II) modeset(0): Modeline "840x525"x60.0   73.12  840 892 980 1120  525 526 529 544 doublescan -hsync +vsync (65.3 kHz d)
[    11.548] (II) modeset(0): Modeline "840x525"x59.9   59.50  840 864 880 920  525 526 529 540 doublescan +hsync -vsync (64.7 kHz d)
[    11.548] (II) modeset(0): Modeline "864x486"x59.9   32.50  864 888 968 1072  486 489 494 506 -hsync +vsync (30.3 kHz d)
[    11.548] (II) modeset(0): Modeline "864x486"x59.6   30.50  864 912 944 1024  486 489 494 500 +hsync -vsync (29.8 kHz d)
[    11.548] (II) modeset(0): Modeline "720x576"x50.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[    11.548] (II) modeset(0): Modeline "700x525"x74.8   77.90  700 732 892 956  525 526 532 545 doublescan +hsync +vsync (81.5 kHz d)
[    11.548] (II) modeset(0): Modeline "700x525"x60.0   61.00  700 744 820 940  525 526 532 541 doublescan +hsync +vsync (64.9 kHz d)
[    11.548] (II) modeset(0): Modeline "800x450"x59.9   59.12  800 848 928 1056  450 451 454 467 doublescan -hsync +vsync (56.0 kHz d)
[    11.548] (II) modeset(0): Modeline "800x450"x59.8   48.75  800 824 840 880  450 451 454 463 doublescan +hsync -vsync (55.4 kHz d)
[    11.548] (II) modeset(0): Modeline "720x480"x60.0   27.03  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    11.548] (II) modeset(0): Modeline "720x480"x59.9   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    11.548] (II) modeset(0): Modeline "640x512"x75.0   67.50  640 648 720 844  512 512 514 533 doublescan +hsync +vsync (80.0 kHz d)
[    11.548] (II) modeset(0): Modeline "640x512"x60.0   54.00  640 664 720 844  512 512 514 533 doublescan +hsync +vsync (64.0 kHz d)
[    11.548] (II) modeset(0): Modeline "700x450"x60.0   51.75  700 740 812 924  450 451 456 467 doublescan -hsync +vsync (56.0 kHz d)
[    11.548] (II) modeset(0): Modeline "700x450"x59.9   43.25  700 724 740 780  450 451 456 463 doublescan +hsync -vsync (55.4 kHz d)
[    11.548] (II) modeset(0): Modeline "640x480"x60.0   54.00  640 688 744 900  480 480 482 500 doublescan +hsync +vsync (60.0 kHz d)
[    11.548] (II) modeset(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    11.548] (II) modeset(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz e)
[    11.548] (II) modeset(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz d)
[    11.548] (II) modeset(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[    11.548] (II) modeset(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    11.548] (II) modeset(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    11.548] (II) modeset(0): Modeline "720x405"x59.5   22.50  720 744 808 896  405 408 413 422 -hsync +vsync (25.1 kHz d)
[    11.548] (II) modeset(0): Modeline "720x405"x59.0   21.75  720 768 800 880  405 408 413 419 +hsync -vsync (24.7 kHz d)
[    11.548] (II) modeset(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    11.548] (II) modeset(0): Modeline "684x384"x59.9   42.62  684 720 788 892  384 385 390 399 doublescan -hsync +vsync (47.8 kHz d)
[    11.548] (II) modeset(0): Modeline "684x384"x59.9   36.12  684 708 724 764  384 385 390 395 doublescan +hsync -vsync (47.3 kHz d)
[    11.548] (II) modeset(0): Modeline "640x400"x59.9   41.75  640 676 740 840  400 401 404 415 doublescan -hsync +vsync (49.7 kHz d)
[    11.548] (II) modeset(0): Modeline "640x400"x60.0   35.50  640 664 680 720  400 401 404 411 doublescan +hsync -vsync (49.3 kHz d)
[    11.548] (II) modeset(0): Modeline "576x432"x75.0   54.00  576 608 672 800  432 432 434 450 doublescan +hsync +vsync (67.5 kHz d)
[    11.548] (II) modeset(0): Modeline "640x360"x59.9   37.25  640 672 736 832  360 361 364 374 doublescan -hsync +vsync (44.8 kHz d)
[    11.548] (II) modeset(0): Modeline "640x360"x59.8   31.88  640 664 680 720  360 361 364 370 doublescan +hsync -vsync (44.3 kHz d)
[    11.548] (II) modeset(0): Modeline "640x360"x59.8   18.00  640 664 720 800  360 363 368 376 -hsync +vsync (22.5 kHz d)
[    11.548] (II) modeset(0): Modeline "640x360"x59.3   17.75  640 688 720 800  360 363 368 374 +hsync -vsync (22.2 kHz d)
[    11.548] (II) modeset(0): Modeline "512x384"x75.0   39.38  512 520 568 656  384 384 386 400 doublescan +hsync +vsync (60.0 kHz d)
[    11.548] (II) modeset(0): Modeline "512x384"x70.1   37.50  512 524 592 664  384 385 388 403 doublescan -hsync -vsync (56.5 kHz d)
[    11.548] (II) modeset(0): Modeline "512x384"x60.0   32.50  512 524 592 672  384 385 388 403 doublescan -hsync -vsync (48.4 kHz d)
[    11.548] (II) modeset(0): Modeline "512x288"x60.0   23.25  512 532 580 648  288 289 292 299 doublescan -hsync +vsync (35.9 kHz d)
[    11.548] (II) modeset(0): Modeline "512x288"x59.9   21.00  512 536 552 592  288 289 292 296 doublescan +hsync -vsync (35.5 kHz d)
[    11.548] (II) modeset(0): Modeline "416x312"x74.7   28.64  416 432 464 576  312 312 314 333 doublescan -hsync -vsync (49.7 kHz d)
[    11.548] (II) modeset(0): Modeline "480x270"x59.6   20.38  480 496 544 608  270 271 274 281 doublescan -hsync +vsync (33.5 kHz d)
[    11.548] (II) modeset(0): Modeline "480x270"x59.8   18.62  480 504 520 560  270 271 274 278 doublescan +hsync -vsync (33.3 kHz d)
[    11.548] (II) modeset(0): Modeline "400x300"x72.2   25.00  400 428 488 520  300 318 321 333 doublescan +hsync +vsync (48.1 kHz d)
[    11.548] (II) modeset(0): Modeline "400x300"x75.1   24.75  400 408 448 528  300 300 302 312 doublescan +hsync +vsync (46.9 kHz d)
[    11.548] (II) modeset(0): Modeline "400x300"x60.3   20.00  400 420 484 528  300 300 302 314 doublescan +hsync +vsync (37.9 kHz d)
[    11.548] (II) modeset(0): Modeline "400x300"x56.3   18.00  400 412 448 512  300 300 301 312 doublescan +hsync +vsync (35.2 kHz d)
[    11.548] (II) modeset(0): Modeline "432x243"x59.9   16.25  432 444 484 536  243 244 247 253 doublescan -hsync +vsync (30.3 kHz d)
[    11.548] (II) modeset(0): Modeline "432x243"x59.6   15.25  432 456 472 512  243 244 247 250 doublescan +hsync -vsync (29.8 kHz d)
[    11.548] (II) modeset(0): Modeline "320x240"x72.8   15.75  320 332 352 416  240 244 246 260 doublescan -hsync -vsync (37.9 kHz d)
[    11.548] (II) modeset(0): Modeline "320x240"x75.0   15.75  320 328 360 420  240 240 242 250 doublescan -hsync -vsync (37.5 kHz d)
[    11.548] (II) modeset(0): Modeline "320x240"x60.1   12.59  320 328 376 400  240 245 246 262 doublescan -hsync -vsync (31.5 kHz d)
[    11.548] (II) modeset(0): Modeline "360x202"x59.5   11.25  360 372 404 448  202 204 206 211 doublescan -hsync +vsync (25.1 kHz d)
[    11.548] (II) modeset(0): Modeline "360x202"x59.1   10.88  360 384 400 440  202 204 206 209 doublescan +hsync -vsync (24.7 kHz d)
[    11.548] (II) modeset(0): Modeline "320x180"x59.8    9.00  320 332 360 400  180 181 184 188 doublescan -hsync +vsync (22.5 kHz d)
[    11.548] (II) modeset(0): Modeline "320x180"x59.3    8.88  320 344 360 400  180 181 184 187 doublescan +hsync -vsync (22.2 kHz d)
[    11.581] (II) modeset(0): EDID for output DP-2
[    11.582] (II) modeset(0): EDID for output HDMI-1
[    11.583] (II) modeset(0): EDID for output HDMI-2
[    11.583] (II) modeset(0): Output DVI-D-1 disconnected
[    11.583] (II) modeset(0): Output DP-1 connected
[    11.583] (II) modeset(0): Output DP-2 disconnected
[    11.583] (II) modeset(0): Output HDMI-1 disconnected
[    11.583] (II) modeset(0): Output HDMI-2 disconnected
[    11.583] (II) modeset(0): Using exact sizes for initial modes
[    11.583] (II) modeset(0): Output DP-1 using initial mode 2560x1440 +0+0
[    11.583] (==) modeset(0): Using gamma correction (1.0, 1.0, 1.0)
[    11.583] (==) modeset(0): DPI set to (96, 96)
[    11.583] (II) Loading sub module "fb"
[    11.583] (II) LoadModule: "fb"
[    11.583] (II) Loading /usr/lib64/xorg/modules/libfb.so
[    11.584] (II) Module fb: vendor="X.Org Foundation"
[    11.584] 	compiled for 1.20.9, module version = 1.0.0
[    11.584] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    11.584] (II) UnloadModule: "fbdev"
[    11.584] (II) Unloading fbdev
[    11.584] (II) UnloadSubModule: "fbdevhw"
[    11.584] (II) Unloading fbdevhw
[    11.584] (II) UnloadModule: "vesa"
[    11.584] (II) Unloading vesa
[    11.613] (==) modeset(0): Backing store enabled
[    11.613] (==) modeset(0): Silken mouse enabled
[    11.620] (II) modeset(0): Initializing kms color map for depth 24, 8 bpc.
[    11.620] (==) modeset(0): DPMS enabled
[    11.620] (II) modeset(0): [DRI2] Setup complete
[    11.620] (II) modeset(0): [DRI2]   DRI driver: nouveau
[    11.620] (II) modeset(0): [DRI2]   VDPAU driver: nouveau
[    11.620] (II) Initializing extension Generic Event Extension
[    11.620] (II) Initializing extension SHAPE
[    11.620] (II) Initializing extension MIT-SHM
[    11.620] (II) Initializing extension XInputExtension
[    11.620] (II) Initializing extension XTEST
[    11.620] (II) Initializing extension BIG-REQUESTS
[    11.620] (II) Initializing extension SYNC
[    11.620] (II) Initializing extension XKEYBOARD
[    11.621] (II) Initializing extension XC-MISC
[    11.621] (II) Initializing extension SECURITY
[    11.621] (II) Initializing extension XFIXES
[    11.621] (II) Initializing extension RENDER
[    11.621] (II) Initializing extension RANDR
[    11.621] (II) Initializing extension COMPOSITE
[    11.621] (II) Initializing extension DAMAGE
[    11.621] (II) Initializing extension MIT-SCREEN-SAVER
[    11.621] (II) Initializing extension DOUBLE-BUFFER
[    11.621] (II) Initializing extension RECORD
[    11.621] (II) Initializing extension DPMS
[    11.621] (II) Initializing extension Present
[    11.621] (II) Initializing extension DRI3
[    11.621] (II) Initializing extension X-Resource
[    11.622] (II) Initializing extension XVideo
[    11.622] (II) Initializing extension XVideo-MotionCompensation
[    11.622] (II) Initializing extension SELinux
[    11.622] (II) SELinux: Disabled by boolean
[    11.622] (II) Initializing extension GLX
[    11.624] (II) AIGLX: Loaded and initialized nouveau
[    11.624] (II) GLX: Initialized DRI2 GL provider for screen 0
[    11.624] (II) Initializing extension XFree86-VidModeExtension
[    11.624] (II) Initializing extension XFree86-DGA
[    11.624] (II) Initializing extension XFree86-DRI
[    11.624] (II) Initializing extension DRI2
[    11.626] (II) modeset(0): Damage tracking initialized
[    11.626] (II) modeset(0): Setting screen physical size to 677 x 381
[    11.662] (II) config/udev: Adding input device Power Button (/dev/input/event2)
[    11.662] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    11.662] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[    11.662] (**) Power Button: Applying InputClass "system-keyboard"
[    11.662] (II) LoadModule: "libinput"
[    11.662] (II) Loading /usr/lib64/xorg/modules/input/libinput_drv.so
[    11.667] (II) Module libinput: vendor="X.Org Foundation"
[    11.667] 	compiled for 1.20.8, module version = 0.30.0
[    11.667] 	Module class: X.Org XInput Driver
[    11.667] 	ABI class: X.Org XInput driver, version 24.1
[    11.667] (II) Using input driver 'libinput' for 'Power Button'
[    11.667] (**) Power Button: always reports core events
[    11.667] (**) Option "Device" "/dev/input/event2"
[    11.667] (**) Option "_source" "server/udev"
[    11.673] (II) event2  - Power Button: is tagged by udev as: Keyboard
[    11.673] (II) event2  - Power Button: device is a keyboard
[    11.673] (II) event2  - Power Button: device removed
[    11.682] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input2/event2"
[    11.682] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 6)
[    11.682] (**) Option "xkb_layout" "dk"
[    11.692] (II) event2  - Power Button: is tagged by udev as: Keyboard
[    11.692] (II) event2  - Power Button: device is a keyboard
[    11.693] (II) config/udev: Adding input device Power Button (/dev/input/event1)
[    11.693] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    11.693] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[    11.693] (**) Power Button: Applying InputClass "system-keyboard"
[    11.693] (II) Using input driver 'libinput' for 'Power Button'
[    11.693] (**) Power Button: always reports core events
[    11.693] (**) Option "Device" "/dev/input/event1"
[    11.693] (**) Option "_source" "server/udev"
[    11.693] (II) event1  - Power Button: is tagged by udev as: Keyboard
[    11.693] (II) event1  - Power Button: device is a keyboard
[    11.694] (II) event1  - Power Button: device removed
[    11.702] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1/event1"
[    11.702] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 7)
[    11.702] (**) Option "xkb_layout" "dk"
[    11.702] (II) event1  - Power Button: is tagged by udev as: Keyboard
[    11.703] (II) event1  - Power Button: device is a keyboard
[    11.703] (II) config/udev: Adding input device Sleep Button (/dev/input/event0)
[    11.703] (**) Sleep Button: Applying InputClass "evdev keyboard catchall"
[    11.703] (**) Sleep Button: Applying InputClass "libinput keyboard catchall"
[    11.703] (**) Sleep Button: Applying InputClass "system-keyboard"
[    11.703] (II) Using input driver 'libinput' for 'Sleep Button'
[    11.703] (**) Sleep Button: always reports core events
[    11.703] (**) Option "Device" "/dev/input/event0"
[    11.703] (**) Option "_source" "server/udev"
[    11.704] (II) event0  - Sleep Button: is tagged by udev as: Keyboard
[    11.704] (II) event0  - Sleep Button: device is a keyboard
[    11.704] (II) event0  - Sleep Button: device removed
[    11.714] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0/event0"
[    11.714] (II) XINPUT: Adding extended input device "Sleep Button" (type: KEYBOARD, id 8)
[    11.714] (**) Option "xkb_layout" "dk"
[    11.715] (II) event0  - Sleep Button: is tagged by udev as: Keyboard
[    11.715] (II) event0  - Sleep Button: device is a keyboard
[    11.715] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=7 (/dev/input/event10)
[    11.715] (II) No input driver specified, ignoring this device.
[    11.715] (II) This device may have been added with another device file.
[    11.716] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=8 (/dev/input/event11)
[    11.716] (II) No input driver specified, ignoring this device.
[    11.716] (II) This device may have been added with another device file.
[    11.716] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=9 (/dev/input/event12)
[    11.716] (II) No input driver specified, ignoring this device.
[    11.716] (II) This device may have been added with another device file.
[    11.716] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=10 (/dev/input/event13)
[    11.716] (II) No input driver specified, ignoring this device.
[    11.716] (II) This device may have been added with another device file.
[    11.717] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=11 (/dev/input/event14)
[    11.717] (II) No input driver specified, ignoring this device.
[    11.717] (II) This device may have been added with another device file.
[    11.717] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=12 (/dev/input/event15)
[    11.717] (II) No input driver specified, ignoring this device.
[    11.717] (II) This device may have been added with another device file.
[    11.717] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=3 (/dev/input/event9)
[    11.717] (II) No input driver specified, ignoring this device.
[    11.717] (II) This device may have been added with another device file.
[    11.718] (II) config/udev: Adding input device Microsoft Wired Keyboard 600 (/dev/input/event4)
[    11.718] (**) Microsoft Wired Keyboard 600: Applying InputClass "evdev keyboard catchall"
[    11.718] (**) Microsoft Wired Keyboard 600: Applying InputClass "libinput keyboard catchall"
[    11.718] (**) Microsoft Wired Keyboard 600: Applying InputClass "system-keyboard"
[    11.718] (II) Using input driver 'libinput' for 'Microsoft Wired Keyboard 600'
[    11.718] (**) Microsoft Wired Keyboard 600: always reports core events
[    11.718] (**) Option "Device" "/dev/input/event4"
[    11.718] (**) Option "_source" "server/udev"
[    11.719] (II) event4  - Microsoft Wired Keyboard 600: is tagged by udev as: Keyboard
[    11.719] (II) event4  - Microsoft Wired Keyboard 600: device is a keyboard
[    11.720] (II) event4  - Microsoft Wired Keyboard 600: device removed
[    11.730] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.0/0003:045E:07F8.0002/input/input4/event4"
[    11.730] (II) XINPUT: Adding extended input device "Microsoft Wired Keyboard 600" (type: KEYBOARD, id 9)
[    11.730] (**) Option "xkb_layout" "dk"
[    11.731] (II) event4  - Microsoft Wired Keyboard 600: is tagged by udev as: Keyboard
[    11.731] (II) event4  - Microsoft Wired Keyboard 600: device is a keyboard
[    11.732] (II) config/udev: Adding input device Microsoft Wired Keyboard 600 Consumer Control (/dev/input/event5)
[    11.732] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "evdev keyboard catchall"
[    11.732] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "libinput keyboard catchall"
[    11.732] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "system-keyboard"
[    11.732] (II) Using input driver 'libinput' for 'Microsoft Wired Keyboard 600 Consumer Control'
[    11.732] (**) Microsoft Wired Keyboard 600 Consumer Control: always reports core events
[    11.732] (**) Option "Device" "/dev/input/event5"
[    11.732] (**) Option "_source" "server/udev"
[    11.734] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: is tagged by udev as: Keyboard
[    11.734] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: device is a keyboard
[    11.734] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: device removed
[    11.742] (II) libinput: Microsoft Wired Keyboard 600 Consumer Control: needs a virtual subdevice
[    11.742] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.1/0003:045E:07F8.0003/input/input5/event5"
[    11.742] (II) XINPUT: Adding extended input device "Microsoft Wired Keyboard 600 Consumer Control" (type: MOUSE, id 10)
[    11.742] (**) Option "AccelerationScheme" "none"
[    11.742] (**) Microsoft Wired Keyboard 600 Consumer Control: (accel) selected scheme none/0
[    11.742] (**) Microsoft Wired Keyboard 600 Consumer Control: (accel) acceleration factor: 2.000
[    11.742] (**) Microsoft Wired Keyboard 600 Consumer Control: (accel) acceleration threshold: 4
[    11.744] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: is tagged by udev as: Keyboard
[    11.744] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: device is a keyboard
[    11.745] (II) config/udev: Adding input device Microsoft Wired Keyboard 600 System Control (/dev/input/event6)
[    11.745] (**) Microsoft Wired Keyboard 600 System Control: Applying InputClass "evdev keyboard catchall"
[    11.745] (**) Microsoft Wired Keyboard 600 System Control: Applying InputClass "libinput keyboard catchall"
[    11.745] (**) Microsoft Wired Keyboard 600 System Control: Applying InputClass "system-keyboard"
[    11.745] (II) Using input driver 'libinput' for 'Microsoft Wired Keyboard 600 System Control'
[    11.745] (**) Microsoft Wired Keyboard 600 System Control: always reports core events
[    11.745] (**) Option "Device" "/dev/input/event6"
[    11.745] (**) Option "_source" "server/udev"
[    11.746] (II) event6  - Microsoft Wired Keyboard 600 System Control: is tagged by udev as: Keyboard
[    11.746] (II) event6  - Microsoft Wired Keyboard 600 System Control: device is a keyboard
[    11.747] (II) event6  - Microsoft Wired Keyboard 600 System Control: device removed
[    11.758] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.1/0003:045E:07F8.0003/input/input6/event6"
[    11.758] (II) XINPUT: Adding extended input device "Microsoft Wired Keyboard 600 System Control" (type: KEYBOARD, id 11)
[    11.758] (**) Option "xkb_layout" "dk"
[    11.760] (II) event6  - Microsoft Wired Keyboard 600 System Control: is tagged by udev as: Keyboard
[    11.760] (II) event6  - Microsoft Wired Keyboard 600 System Control: device is a keyboard
[    11.761] (II) config/udev: Adding input device Logitech USB-PS/2 Optical Mouse (/dev/input/event3)
[    11.761] (**) Logitech USB-PS/2 Optical Mouse: Applying InputClass "evdev pointer catchall"
[    11.761] (**) Logitech USB-PS/2 Optical Mouse: Applying InputClass "libinput pointer catchall"
[    11.761] (II) Using input driver 'libinput' for 'Logitech USB-PS/2 Optical Mouse'
[    11.761] (**) Logitech USB-PS/2 Optical Mouse: always reports core events
[    11.761] (**) Option "Device" "/dev/input/event3"
[    11.761] (**) Option "_source" "server/udev"
[    11.817] (II) event3  - Logitech USB-PS/2 Optical Mouse: is tagged by udev as: Mouse
[    11.817] (II) event3  - Logitech USB-PS/2 Optical Mouse: device is a pointer
[    11.818] (II) event3  - Logitech USB-PS/2 Optical Mouse: device removed
[    11.835] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/0003:046D:C051.0001/input/input3/event3"
[    11.835] (II) XINPUT: Adding extended input device "Logitech USB-PS/2 Optical Mouse" (type: MOUSE, id 12)
[    11.835] (**) Option "AccelerationScheme" "none"
[    11.835] (**) Logitech USB-PS/2 Optical Mouse: (accel) selected scheme none/0
[    11.835] (**) Logitech USB-PS/2 Optical Mouse: (accel) acceleration factor: 2.000
[    11.835] (**) Logitech USB-PS/2 Optical Mouse: (accel) acceleration threshold: 4
[    11.892] (II) event3  - Logitech USB-PS/2 Optical Mouse: is tagged by udev as: Mouse
[    11.892] (II) event3  - Logitech USB-PS/2 Optical Mouse: device is a pointer
[    11.895] (II) config/udev: Adding input device Logitech USB-PS/2 Optical Mouse (/dev/input/mouse0)
[    11.895] (II) No input driver specified, ignoring this device.
[    11.895] (II) This device may have been added with another device file.
[    11.896] (II) config/udev: Adding input device HDA Intel PCH Front Mic (/dev/input/event16)
[    11.896] (II) No input driver specified, ignoring this device.
[    11.896] (II) This device may have been added with another device file.
[    11.897] (II) config/udev: Adding input device HDA Intel PCH Rear Mic (/dev/input/event17)
[    11.897] (II) No input driver specified, ignoring this device.
[    11.897] (II) This device may have been added with another device file.
[    11.898] (II) config/udev: Adding input device HDA Intel PCH Line (/dev/input/event18)
[    11.898] (II) No input driver specified, ignoring this device.
[    11.898] (II) This device may have been added with another device file.
[    11.899] (II) config/udev: Adding input device HDA Intel PCH Line Out (/dev/input/event19)
[    11.900] (II) No input driver specified, ignoring this device.
[    11.900] (II) This device may have been added with another device file.
[    11.901] (II) config/udev: Adding input device HDA Intel PCH Front Headphone (/dev/input/event20)
[    11.901] (II) No input driver specified, ignoring this device.
[    11.901] (II) This device may have been added with another device file.
[    11.902] (II) config/udev: Adding input device Eee PC WMI hotkeys (/dev/input/event8)
[    11.902] (**) Eee PC WMI hotkeys: Applying InputClass "evdev keyboard catchall"
[    11.902] (**) Eee PC WMI hotkeys: Applying InputClass "libinput keyboard catchall"
[    11.902] (**) Eee PC WMI hotkeys: Applying InputClass "system-keyboard"
[    11.902] (II) Using input driver 'libinput' for 'Eee PC WMI hotkeys'
[    11.902] (**) Eee PC WMI hotkeys: always reports core events
[    11.902] (**) Option "Device" "/dev/input/event8"
[    11.902] (**) Option "_source" "server/udev"
[    11.905] (II) event8  - Eee PC WMI hotkeys: is tagged by udev as: Keyboard
[    11.905] (II) event8  - Eee PC WMI hotkeys: device is a keyboard
[    11.906] (II) event8  - Eee PC WMI hotkeys: device removed
[    11.926] (**) Option "config_info" "udev:/sys/devices/platform/eeepc-wmi/input/input8/event8"
[    11.926] (II) XINPUT: Adding extended input device "Eee PC WMI hotkeys" (type: KEYBOARD, id 13)
[    11.926] (**) Option "xkb_layout" "dk"
[    11.929] (II) event8  - Eee PC WMI hotkeys: is tagged by udev as: Keyboard
[    11.929] (II) event8  - Eee PC WMI hotkeys: device is a keyboard
[    11.931] (II) config/udev: Adding input device PC Speaker (/dev/input/event7)
[    11.931] (II) No input driver specified, ignoring this device.
[    11.931] (II) This device may have been added with another device file.
[    11.951] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "evdev keyboard catchall"
[    11.951] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "libinput keyboard catchall"
[    11.951] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "system-keyboard"
[    11.951] (II) Using input driver 'libinput' for 'Microsoft Wired Keyboard 600 Consumer Control'
[    11.951] (**) Microsoft Wired Keyboard 600 Consumer Control: always reports core events
[    11.952] (**) Option "Device" "/dev/input/event5"
[    11.952] (**) Option "_source" "_driver/libinput"
[    11.952] (II) libinput: Microsoft Wired Keyboard 600 Consumer Control: is a virtual subdevice
[    11.952] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.1/0003:045E:07F8.0003/input/input5/event5"
[    11.952] (II) XINPUT: Adding extended input device "Microsoft Wired Keyboard 600 Consumer Control" (type: KEYBOARD, id 14)
[    11.952] (**) Option "xkb_layout" "dk"
[    13.209] (II) modeset(0): Disabling kernel dirty updates, not required.
[    38.969] (II) event2  - Power Button: device removed
[    38.981] (II) event1  - Power Button: device removed
[    38.987] (II) event0  - Sleep Button: device removed
[    38.995] (II) event4  - Microsoft Wired Keyboard 600: device removed
[    39.001] (II) event6  - Microsoft Wired Keyboard 600 System Control: device removed
[    39.027] (II) event3  - Logitech USB-PS/2 Optical Mouse: device removed
[    39.038] (II) event8  - Eee PC WMI hotkeys: device removed
[    39.049] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: device removed
[    39.062] (II) UnloadModule: "libinput"
[    39.062] (II) UnloadModule: "libinput"
[    39.062] (II) UnloadModule: "libinput"
[    39.062] (II) UnloadModule: "libinput"
[    39.062] (II) UnloadModule: "libinput"
[    39.062] (II) UnloadModule: "libinput"
[    39.062] (II) UnloadModule: "libinput"
[    39.062] (II) UnloadModule: "libinput"
[    39.063] (II) UnloadModule: "libinput"
[    39.079] (II) Server terminated successfully (0). Closing log file.

---

Xorg.0.log (X server succeeds on Fedora 5.8.18)

[     9.684] 
X.Org X Server 1.20.9
X Protocol Version 11, Revision 0
[     9.684] Build Operating System:  5.8.7-200.fc32.x86_64 
[     9.684] Current Operating System: Linux thor 5.8.18-300.fc33.x86_64 #1 SMP Mon Nov 2 19:09:05 UTC 2020 x86_64
[     9.684] Kernel command line: BOOT_IMAGE=(hd0,gpt6)/vmlinuz-5.8.18-300.fc33.x86_64 root=/dev/mapper/fedora-root ro rd.lvm.lv=fedora/root rd.lvm.lv=fedora/swap rhgb quiet
[     9.684] Build Date: 08 October 2020  12:00:00AM
[     9.684] Build ID: xorg-x11-server 1.20.9-1.fc33 
[     9.684] Current version of pixman: 0.40.0
[     9.684] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[     9.684] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[     9.684] (==) Log file: "/var/log/Xorg.0.log", Time: Mon Nov 30 16:14:29 2020
[     9.687] (==) Using config directory: "/etc/X11/xorg.conf.d"
[     9.687] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[     9.688] (==) No Layout section.  Using the first Screen section.
[     9.688] (==) No screen section available. Using defaults.
[     9.688] (**) |-->Screen "Default Screen Section" (0)
[     9.689] (**) |   |-->Monitor "<default monitor>"
[     9.689] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[     9.689] (==) Automatically adding devices
[     9.689] (==) Automatically enabling devices
[     9.689] (==) Automatically adding GPU devices
[     9.689] (==) Automatically binding GPU devices
[     9.689] (==) Max clients allowed: 256, resource mask: 0x1fffff
[     9.689] (==) FontPath set to:
	catalogue:/etc/X11/fontpath.d,
	built-ins
[     9.689] (==) ModulePath set to "/usr/lib64/xorg/modules"
[     9.689] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[     9.689] (II) Loader magic: 0x55c766f8ab20
[     9.689] (II) Module ABI versions:
[     9.689] 	X.Org ANSI C Emulation: 0.4
[     9.689] 	X.Org Video Driver: 24.1
[     9.689] 	X.Org XInput driver : 24.1
[     9.689] 	X.Org Server Extension : 10.0
[     9.690] (++) using VT number 1

[     9.690] (II) systemd-logind: logind integration requires -keeptty and -keeptty was not provided, disabling logind integration
[     9.691] (II) xfree86: Adding drm device (/dev/dri/card0)
[     9.694] (--) PCI:*(1@0:0:0) 10de:1b82:1043:861e rev 161, Mem @ 0xf6000000/16777216, 0xe0000000/268435456, 0xf0000000/33554432, I/O @ 0x0000e000/128, BIOS @ 0x????????/131072
[     9.694] (II) LoadModule: "glx"
[     9.695] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[     9.703] (II) Module glx: vendor="X.Org Foundation"
[     9.703] 	compiled for 1.20.9, module version = 1.0.0
[     9.703] 	ABI class: X.Org Server Extension, version 10.0
[     9.836] (==) Matched modesetting as autoconfigured driver 0
[     9.836] (==) Matched fbdev as autoconfigured driver 1
[     9.836] (==) Matched vesa as autoconfigured driver 2
[     9.836] (==) Assigned the driver to the xf86ConfigLayout
[     9.836] (II) LoadModule: "modesetting"
[     9.838] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[     9.839] (II) Module modesetting: vendor="X.Org Foundation"
[     9.839] 	compiled for 1.20.9, module version = 1.20.9
[     9.839] 	Module class: X.Org Video Driver
[     9.839] 	ABI class: X.Org Video Driver, version 24.1
[     9.839] (II) LoadModule: "fbdev"
[     9.839] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[     9.840] (II) Module fbdev: vendor="X.Org Foundation"
[     9.840] 	compiled for 1.20.8, module version = 0.5.0
[     9.840] 	Module class: X.Org Video Driver
[     9.840] 	ABI class: X.Org Video Driver, version 24.1
[     9.840] (II) LoadModule: "vesa"
[     9.840] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[     9.841] (II) Module vesa: vendor="X.Org Foundation"
[     9.841] 	compiled for 1.20.8, module version = 2.4.0
[     9.841] 	Module class: X.Org Video Driver
[     9.841] 	ABI class: X.Org Video Driver, version 24.1
[     9.841] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[     9.841] (II) FBDEV: driver for framebuffer: fbdev
[     9.841] (II) VESA: driver for VESA chipsets: vesa
[     9.842] (II) modeset(0): using drv /dev/dri/card0
[     9.842] (WW) Falling back to old probe method for fbdev
[     9.842] (II) Loading sub module "fbdevhw"
[     9.842] (II) LoadModule: "fbdevhw"
[     9.843] (II) Loading /usr/lib64/xorg/modules/libfbdevhw.so
[     9.843] (II) Module fbdevhw: vendor="X.Org Foundation"
[     9.843] 	compiled for 1.20.9, module version = 0.0.2
[     9.844] 	ABI class: X.Org Video Driver, version 24.1
[     9.844] (II) modeset(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[     9.844] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
[     9.844] (==) modeset(0): RGB weight 888
[     9.844] (==) modeset(0): Default visual is TrueColor
[     9.844] (II) Loading sub module "glamoregl"
[     9.844] (II) LoadModule: "glamoregl"
[     9.845] (II) Loading /usr/lib64/xorg/modules/libglamoregl.so
[     9.858] (II) Module glamoregl: vendor="X.Org Foundation"
[     9.858] 	compiled for 1.20.9, module version = 1.0.1
[     9.858] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    10.108] (II) modeset(0): glamor X acceleration enabled on NV134
[    10.108] (II) modeset(0): glamor initialized
[    10.109] (II) modeset(0): Output DVI-D-1 has no monitor section
[    10.153] (II) modeset(0): Output DP-1 has no monitor section
[    10.185] (II) modeset(0): Output DP-2 has no monitor section
[    10.186] (II) modeset(0): Output HDMI-1 has no monitor section
[    10.187] (II) modeset(0): Output HDMI-2 has no monitor section
[    10.189] (II) modeset(0): EDID for output DVI-D-1
[    10.232] (II) modeset(0): EDID for output DP-1
[    10.232] (II) modeset(0): Manufacturer: PHL  Model: 8fa  Serial#: 6913
[    10.232] (II) modeset(0): Year: 2017  Week: 43
[    10.232] (II) modeset(0): EDID Version: 1.4
[    10.232] (II) modeset(0): Digital Display Input
[    10.232] (II) modeset(0): 10 bits per channel
[    10.232] (II) modeset(0): Digital interface is DisplayPort
[    10.232] (II) modeset(0): Max Image Size [cm]: horiz.: 95  vert.: 54
[    10.232] (II) modeset(0): Gamma: 2.20
[    10.232] (II) modeset(0): DPMS capabilities: Off
[    10.232] (II) modeset(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 YCrCb 4:2:2
[    10.232] (II) modeset(0): First detailed timing is preferred mode
[    10.232] (II) modeset(0): Preferred mode is native pixel format and refresh rate
[    10.232] (II) modeset(0): redX: 0.646 redY: 0.333   greenX: 0.326 greenY: 0.609
[    10.232] (II) modeset(0): blueX: 0.145 blueY: 0.050   whiteX: 0.280 whiteY: 0.290
[    10.232] (II) modeset(0): Supported established timings:
[    10.232] (II) modeset(0): 720x400@70Hz
[    10.232] (II) modeset(0): 640x480@60Hz
[    10.232] (II) modeset(0): 640x480@67Hz
[    10.232] (II) modeset(0): 640x480@72Hz
[    10.232] (II) modeset(0): 640x480@75Hz
[    10.232] (II) modeset(0): 800x600@56Hz
[    10.232] (II) modeset(0): 800x600@60Hz
[    10.232] (II) modeset(0): 800x600@72Hz
[    10.232] (II) modeset(0): 800x600@75Hz
[    10.232] (II) modeset(0): 832x624@75Hz
[    10.232] (II) modeset(0): 1024x768@60Hz
[    10.232] (II) modeset(0): 1024x768@70Hz
[    10.232] (II) modeset(0): 1024x768@75Hz
[    10.232] (II) modeset(0): 1280x1024@75Hz
[    10.232] (II) modeset(0): Manufacturer's mask: 0
[    10.232] (II) modeset(0): Supported standard timings:
[    10.232] (II) modeset(0): #0: hsize: 1920  vsize 1080  refresh: 60  vid: 49361
[    10.232] (II) modeset(0): #1: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[    10.232] (II) modeset(0): #2: hsize: 1440  vsize 900  refresh: 60  vid: 149
[    10.232] (II) modeset(0): #3: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[    10.232] (II) modeset(0): #4: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[    10.232] (II) modeset(0): #5: hsize: 1280  vsize 720  refresh: 60  vid: 49281
[    10.232] (II) modeset(0): Supported detailed timing:
[    10.232] (II) modeset(0): clock: 533.2 MHz   Image Size:  953 x 543 mm
[    10.232] (II) modeset(0): h_active: 3840  h_sync: 3888  h_sync_end 3920 h_blank_end 4000 h_border: 0
[    10.232] (II) modeset(0): v_active: 2160  v_sync: 2163  v_sync_end 2168 v_blanking: 2222 v_border: 0
[    10.232] (II) modeset(0): Supported detailed timing:
[    10.232] (II) modeset(0): clock: 241.5 MHz   Image Size:  953 x 543 mm
[    10.232] (II) modeset(0): h_active: 2560  h_sync: 2608  h_sync_end 2640 h_blank_end 2720 h_border: 0
[    10.232] (II) modeset(0): v_active: 1440  v_sync: 1443  v_sync_end 1448 v_blanking: 1481 v_border: 0
[    10.232] (II) modeset(0): Ranges: V min: 23 V max: 80 Hz, H min: 30 H max: 160 kHz, PixClock max 605 MHz
[    10.232] (II) modeset(0): Monitor name: PHL BDM4350
[    10.232] (II) modeset(0): Supported detailed timing:
[    10.232] (II) modeset(0): clock: 74.2 MHz   Image Size:  953 x 543 mm
[    10.232] (II) modeset(0): h_active: 1280  h_sync: 1390  h_sync_end 1430 h_blank_end 1650 h_border: 0
[    10.232] (II) modeset(0): v_active: 720  v_sync: 725  v_sync_end 730 v_blanking: 750 v_border: 0
[    10.232] (II) modeset(0): Supported detailed timing:
[    10.232] (II) modeset(0): clock: 27.0 MHz   Image Size:  953 x 543 mm
[    10.233] (II) modeset(0): h_active: 720  h_sync: 736  h_sync_end 798 h_blank_end 858 h_border: 0
[    10.233] (II) modeset(0): v_active: 480  v_sync: 489  v_sync_end 495 v_blanking: 525 v_border: 0
[    10.233] (II) modeset(0): Supported detailed timing:
[    10.233] (II) modeset(0): clock: 27.0 MHz   Image Size:  953 x 543 mm
[    10.233] (II) modeset(0): h_active: 720  h_sync: 732  h_sync_end 796 h_blank_end 864 h_border: 0
[    10.233] (II) modeset(0): v_active: 576  v_sync: 581  v_sync_end 586 v_blanking: 625 v_border: 0
[    10.233] (II) modeset(0): Supported detailed timing:
[    10.233] (II) modeset(0): clock: 277.2 MHz   Image Size:  953 x 543 mm
[    10.233] (II) modeset(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[    10.233] (II) modeset(0): v_active: 2160  v_sync: 2163  v_sync_end 2173 v_blanking: 2222 v_border: 0
[    10.233] (II) modeset(0): Number of EDID sections to follow: 1
[    10.233] (II) modeset(0): EDID (in hex):
[    10.233] (II) modeset(0): 	00ffffffffffff00410cfa08011b0000
[    10.233] (II) modeset(0): 	2b1b0104b55f36783a583da555539c25
[    10.233] (II) modeset(0): 	0c474abfef00d1c0b300950081808140
[    10.233] (II) modeset(0): 	81c0010101014dd000a0f0703e803020
[    10.233] (II) modeset(0): 	3500b91f3200001a565e00a0a0a02950
[    10.233] (II) modeset(0): 	30203500b91f3200001e000000fd0017
[    10.233] (II) modeset(0): 	501ea03c010a202020202020000000fc
[    10.233] (II) modeset(0): 	0050484c2042444d343335300a200155
[    10.233] (II) modeset(0): 	020326f14b0103051404131f12021190
[    10.233] (II) modeset(0): 	23090707830100006d030c0010001878
[    10.233] (II) modeset(0): 	200060010203011d007251d01e206e28
[    10.233] (II) modeset(0): 	5500b91f3200001e8c0ad08a20e02d10
[    10.233] (II) modeset(0): 	103e9600b91f320000188c0ad0902040
[    10.233] (II) modeset(0): 	31200c405500b91f320000184d6c80a0
[    10.233] (II) modeset(0): 	70703e8030203a00b91f3200001a0000
[    10.233] (II) modeset(0): 	0000000000000000000000000000006d
[    10.233] (--) modeset(0): HDMI max TMDS frequency 600000KHz
[    10.233] (II) modeset(0): Not using default mode "3840x2160" (bad mode clock/interlace/doublescan)
[    10.233] (II) modeset(0): Not using default mode "2560x1440" (bad mode clock/interlace/doublescan)
[    10.233] (II) modeset(0): Printing probed modes for output DP-1
[    10.233] (II) modeset(0): Modeline "3840x2160"x60.0  533.25  3840 3888 3920 4000  2160 2163 2168 2222 +hsync -vsync (133.3 kHz eP)
[    10.233] (II) modeset(0): Modeline "3840x2160"x60.0  533.00  3840 3888 3920 4000  2160 2163 2168 2222 +hsync -vsync (133.2 kHz d)
[    10.233] (II) modeset(0): Modeline "3840x2160"x30.0  297.00  3840 4016 4104 4400  2160 2168 2178 2250 +hsync +vsync (67.5 kHz e)
[    10.233] (II) modeset(0): Modeline "3840x2160"x25.0  297.00  3840 4896 4984 5280  2160 2168 2178 2250 +hsync +vsync (56.2 kHz e)
[    10.233] (II) modeset(0): Modeline "3840x2160"x24.0  297.00  3840 5116 5204 5500  2160 2168 2178 2250 +hsync +vsync (54.0 kHz e)
[    10.233] (II) modeset(0): Modeline "3840x2160"x30.0  296.70  3840 4016 4104 4400  2160 2168 2178 2250 +hsync +vsync (67.4 kHz e)
[    10.233] (II) modeset(0): Modeline "3840x2160"x24.0  296.70  3840 5116 5204 5500  2160 2168 2178 2250 +hsync +vsync (53.9 kHz e)
[    10.233] (II) modeset(0): Modeline "3200x1800"x60.0  492.00  3200 3456 3800 4400  1800 1803 1808 1865 -hsync +vsync (111.8 kHz d)
[    10.233] (II) modeset(0): Modeline "3200x1800"x59.9  373.00  3200 3248 3280 3360  1800 1803 1808 1852 +hsync -vsync (111.0 kHz d)
[    10.233] (II) modeset(0): Modeline "2880x1620"x60.0  396.25  2880 3096 3408 3936  1620 1623 1628 1679 -hsync +vsync (100.7 kHz d)
[    10.233] (II) modeset(0): Modeline "2880x1620"x60.0  303.75  2880 2928 2960 3040  1620 1623 1628 1666 +hsync -vsync (99.9 kHz d)
[    10.233] (II) modeset(0): Modeline "1920x2160"x60.0  277.25  1920 1968 2000 2080  2160 2163 2173 2222 +hsync -vsync (133.3 kHz e)
[    10.233] (II) modeset(0): Modeline "2560x1600"x60.0  348.50  2560 2760 3032 3504  1600 1603 1609 1658 -hsync +vsync (99.5 kHz d)
[    10.233] (II) modeset(0): Modeline "2560x1600"x60.0  268.50  2560 2608 2640 2720  1600 1603 1609 1646 +hsync -vsync (98.7 kHz d)
[    10.233] (II) modeset(0): Modeline "2560x1440"x60.0  469.12  2560 2584 2600 2640  1440 1441 1444 1481 doublescan +hsync -vsync (177.7 kHz d)
[    10.233] (II) modeset(0): Modeline "2560x1440"x60.0  312.25  2560 2752 3024 3488  1440 1443 1448 1493 -hsync +vsync (89.5 kHz d)
[    10.233] (II) modeset(0): Modeline "2560x1440"x60.0  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync +vsync (88.8 kHz e)
[    10.233] (II) modeset(0): Modeline "2560x1440"x60.0  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz d)
[    10.233] (II) modeset(0): Modeline "2048x1536"x75.0  340.48  2048 2216 2440 2832  1536 1537 1540 1603 -hsync +vsync (120.2 kHz d)
[    10.233] (II) modeset(0): Modeline "2048x1536"x60.0  266.95  2048 2200 2424 2800  1536 1537 1540 1589 -hsync +vsync (95.3 kHz d)
[    10.233] (II) modeset(0): Modeline "1920x1440"x75.0  297.00  1920 2064 2288 2640  1440 1441 1444 1500 -hsync +vsync (112.5 kHz d)
[    10.233] (II) modeset(0): Modeline "1920x1440"x60.0  234.00  1920 2048 2256 2600  1440 1441 1444 1500 -hsync +vsync (90.0 kHz d)
[    10.233] (II) modeset(0): Modeline "1856x1392"x75.0  288.00  1856 1984 2208 2560  1392 1393 1396 1500 -hsync +vsync (112.5 kHz d)
[    10.233] (II) modeset(0): Modeline "1856x1392"x60.0  218.30  1856 1952 2176 2528  1392 1393 1396 1439 -hsync +vsync (86.4 kHz d)
[    10.233] (II) modeset(0): Modeline "1792x1344"x75.0  261.00  1792 1888 2104 2456  1344 1345 1348 1417 -hsync +vsync (106.3 kHz d)
[    10.233] (II) modeset(0): Modeline "1792x1344"x60.0  204.80  1792 1920 2120 2448  1344 1345 1348 1394 -hsync +vsync (83.7 kHz d)
[    10.233] (II) modeset(0): Modeline "2048x1152"x60.0  406.50  2048 2220 2444 2840  1152 1153 1156 1193 doublescan -hsync +vsync (143.1 kHz d)
[    10.233] (II) modeset(0): Modeline "2048x1152"x60.0  302.50  2048 2072 2088 2128  1152 1153 1156 1185 doublescan +hsync -vsync (142.2 kHz d)
[    10.233] (II) modeset(0): Modeline "2048x1152"x59.9  197.00  2048 2184 2400 2752  1152 1155 1160 1195 -hsync +vsync (71.6 kHz d)
[    10.233] (II) modeset(0): Modeline "2048x1152"x59.9  156.75  2048 2096 2128 2208  1152 1155 1160 1185 +hsync -vsync (71.0 kHz d)
[    10.233] (II) modeset(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz d)
[    10.233] (II) modeset(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz d)
[    10.233] (II) modeset(0): Modeline "1920x1080"x60.0  356.38  1920 2080 2288 2656  1080 1081 1084 1118 doublescan -hsync +vsync (134.2 kHz d)
[    10.233] (II) modeset(0): Modeline "1920x1080"x60.0  266.50  1920 1944 1960 2000  1080 1081 1084 1111 doublescan +hsync -vsync (133.2 kHz d)
[    10.233] (II) modeset(0): Modeline "1920x1080"x60.0  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync (67.2 kHz d)
[    10.233] (II) modeset(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 -hsync -vsync (67.5 kHz e)
[    10.233] (II) modeset(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[    10.233] (II) modeset(0): Modeline "1920x1080"x50.0  148.50  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[    10.233] (II) modeset(0): Modeline "1920x1080"x59.9  148.35  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.4 kHz e)
[    10.233] (II) modeset(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz d)
[    10.233] (II) modeset(0): Modeline "1600x1200"x75.0  202.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (93.8 kHz d)
[    10.233] (II) modeset(0): Modeline "1600x1200"x70.0  189.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (87.5 kHz d)
[    10.233] (II) modeset(0): Modeline "1600x1200"x65.0  175.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (81.2 kHz d)
[    10.233] (II) modeset(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz d)
[    10.233] (II) modeset(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz e)
[    10.233] (II) modeset(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz d)
[    10.233] (II) modeset(0): Modeline "1400x1050"x74.8  155.80  1400 1464 1784 1912  1050 1052 1064 1090 +hsync +vsync (81.5 kHz d)
[    10.233] (II) modeset(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880  1050 1052 1064 1082 +hsync +vsync (64.9 kHz d)
[    10.233] (II) modeset(0): Modeline "1600x900"x60.0  246.00  1600 1728 1900 2200  900 901 904 932 doublescan -hsync +vsync (111.8 kHz d)
[    10.233] (II) modeset(0): Modeline "1600x900"x59.9  186.50  1600 1624 1640 1680  900 901 904 926 doublescan +hsync -vsync (111.0 kHz d)
[    10.233] (II) modeset(0): Modeline "1600x900"x59.9  118.25  1600 1696 1856 2112  900 903 908 934 -hsync +vsync (56.0 kHz d)
[    10.233] (II) modeset(0): Modeline "1600x900"x59.8   97.50  1600 1648 1680 1760  900 903 908 926 +hsync -vsync (55.4 kHz d)
[    10.233] (II) modeset(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    10.233] (II) modeset(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    10.233] (II) modeset(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz e)
[    10.233] (II) modeset(0): Modeline "1400x900"x60.0  103.50  1400 1480 1624 1848  900 903 913 934 -hsync +vsync (56.0 kHz d)
[    10.233] (II) modeset(0): Modeline "1400x900"x59.9   86.50  1400 1448 1480 1560  900 903 913 926 +hsync -vsync (55.4 kHz d)
[    10.233] (II) modeset(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    10.233] (II) modeset(0): Modeline "1440x810"x60.0  198.12  1440 1548 1704 1968  810 811 814 839 doublescan -hsync +vsync (100.7 kHz d)
[    10.233] (II) modeset(0): Modeline "1440x810"x60.0  151.88  1440 1464 1480 1520  810 811 814 833 doublescan +hsync -vsync (99.9 kHz d)
[    10.233] (II) modeset(0): Modeline "1368x768"x59.9   85.25  1368 1440 1576 1784  768 771 781 798 -hsync +vsync (47.8 kHz d)
[    10.233] (II) modeset(0): Modeline "1368x768"x59.9   72.25  1368 1416 1448 1528  768 771 781 790 +hsync -vsync (47.3 kHz d)
[    10.233] (II) modeset(0): Modeline "1280x800"x60.0  174.25  1280 1380 1516 1752  800 801 804 829 doublescan -hsync +vsync (99.5 kHz d)
[    10.233] (II) modeset(0): Modeline "1280x800"x60.0  134.25  1280 1304 1320 1360  800 801 804 823 doublescan +hsync -vsync (98.7 kHz d)
[    10.233] (II) modeset(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 -hsync +vsync (49.7 kHz d)
[    10.233] (II) modeset(0): Modeline "1280x800"x59.9   71.00  1280 1328 1360 1440  800 803 809 823 +hsync -vsync (49.3 kHz d)
[    10.233] (II) modeset(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz d)
[    10.233] (II) modeset(0): Modeline "1280x720"x60.0  156.12  1280 1376 1512 1744  720 721 724 746 doublescan -hsync +vsync (89.5 kHz d)
[    10.233] (II) modeset(0): Modeline "1280x720"x60.0  120.75  1280 1304 1320 1360  720 721 724 740 doublescan +hsync -vsync (88.8 kHz d)
[    10.233] (II) modeset(0): Modeline "1280x720"x59.9   74.50  1280 1344 1472 1664  720 723 728 748 -hsync +vsync (44.8 kHz d)
[    10.233] (II) modeset(0): Modeline "1280x720"x60.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    10.233] (II) modeset(0): Modeline "1280x720"x50.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    10.233] (II) modeset(0): Modeline "1280x720"x59.9   74.18  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    10.233] (II) modeset(0): Modeline "1280x720"x59.7   63.75  1280 1328 1360 1440  720 723 728 741 +hsync -vsync (44.3 kHz d)
[    10.233] (II) modeset(0): Modeline "1024x768"x75.0  170.24  1024 1108 1220 1416  768 768 770 801 doublescan -hsync +vsync (120.2 kHz d)
[    10.233] (II) modeset(0): Modeline "1024x768"x60.0  133.47  1024 1100 1212 1400  768 768 770 794 doublescan -hsync +vsync (95.3 kHz d)
[    10.233] (II) modeset(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    10.233] (II) modeset(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    10.233] (II) modeset(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    10.233] (II) modeset(0): Modeline "960x720"x75.0  148.50  960 1032 1144 1320  720 720 722 750 doublescan -hsync +vsync (112.5 kHz d)
[    10.233] (II) modeset(0): Modeline "960x720"x60.0  117.00  960 1024 1128 1300  720 720 722 750 doublescan -hsync +vsync (90.0 kHz d)
[    10.233] (II) modeset(0): Modeline "928x696"x75.0  144.00  928 992 1104 1280  696 696 698 750 doublescan -hsync +vsync (112.5 kHz d)
[    10.233] (II) modeset(0): Modeline "928x696"x60.1  109.15  928 976 1088 1264  696 696 698 719 doublescan -hsync +vsync (86.4 kHz d)
[    10.233] (II) modeset(0): Modeline "896x672"x75.0  130.50  896 944 1052 1228  672 672 674 708 doublescan -hsync +vsync (106.3 kHz d)
[    10.233] (II) modeset(0): Modeline "896x672"x60.0  102.40  896 960 1060 1224  672 672 674 697 doublescan -hsync +vsync (83.7 kHz d)
[    10.233] (II) modeset(0): Modeline "1024x576"x60.0   98.50  1024 1092 1200 1376  576 577 580 597 doublescan -hsync +vsync (71.6 kHz d)
[    10.233] (II) modeset(0): Modeline "1024x576"x60.0   78.38  1024 1048 1064 1104  576 577 580 592 doublescan +hsync -vsync (71.0 kHz d)
[    10.233] (II) modeset(0): Modeline "1024x576"x59.9   46.50  1024 1064 1160 1296  576 579 584 599 -hsync +vsync (35.9 kHz d)
[    10.233] (II) modeset(0): Modeline "1024x576"x59.8   42.00  1024 1072 1104 1184  576 579 584 593 +hsync -vsync (35.5 kHz d)
[    10.233] (II) modeset(0): Modeline "960x600"x59.9   96.62  960 1028 1128 1296  600 601 604 622 doublescan -hsync +vsync (74.6 kHz d)
[    10.233] (II) modeset(0): Modeline "960x600"x60.0   77.00  960 984 1000 1040  600 601 604 617 doublescan +hsync -vsync (74.0 kHz d)
[    10.233] (II) modeset(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[    10.233] (II) modeset(0): Modeline "960x540"x60.0   86.50  960 1024 1124 1288  540 541 544 560 doublescan -hsync +vsync (67.2 kHz d)
[    10.233] (II) modeset(0): Modeline "960x540"x60.0   69.25  960 984 1000 1040  540 541 544 555 doublescan +hsync -vsync (66.6 kHz d)
[    10.233] (II) modeset(0): Modeline "960x540"x59.6   40.75  960 992 1088 1216  540 543 548 562 -hsync +vsync (33.5 kHz d)
[    10.233] (II) modeset(0): Modeline "960x540"x59.8   37.25  960 1008 1040 1120  540 543 548 556 +hsync -vsync (33.3 kHz d)
[    10.233] (II) modeset(0): Modeline "800x600"x75.0  101.25  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (93.8 kHz d)
[    10.233] (II) modeset(0): Modeline "800x600"x70.0   94.50  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (87.5 kHz d)
[    10.233] (II) modeset(0): Modeline "800x600"x65.0   87.75  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (81.2 kHz d)
[    10.233] (II) modeset(0): Modeline "800x600"x60.0   81.00  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (75.0 kHz d)
[    10.233] (II) modeset(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[    10.233] (II) modeset(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    10.233] (II) modeset(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    10.233] (II) modeset(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    10.233] (II) modeset(0): Modeline "840x525"x60.0   73.12  840 892 980 1120  525 526 529 544 doublescan -hsync +vsync (65.3 kHz d)
[    10.233] (II) modeset(0): Modeline "840x525"x59.9   59.50  840 864 880 920  525 526 529 540 doublescan +hsync -vsync (64.7 kHz d)
[    10.233] (II) modeset(0): Modeline "864x486"x59.9   32.50  864 888 968 1072  486 489 494 506 -hsync +vsync (30.3 kHz d)
[    10.233] (II) modeset(0): Modeline "864x486"x59.6   30.50  864 912 944 1024  486 489 494 500 +hsync -vsync (29.8 kHz d)
[    10.233] (II) modeset(0): Modeline "720x576"x50.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[    10.233] (II) modeset(0): Modeline "700x525"x74.8   77.90  700 732 892 956  525 526 532 545 doublescan +hsync +vsync (81.5 kHz d)
[    10.233] (II) modeset(0): Modeline "700x525"x60.0   61.00  700 744 820 940  525 526 532 541 doublescan +hsync +vsync (64.9 kHz d)
[    10.233] (II) modeset(0): Modeline "800x450"x59.9   59.12  800 848 928 1056  450 451 454 467 doublescan -hsync +vsync (56.0 kHz d)
[    10.233] (II) modeset(0): Modeline "800x450"x59.8   48.75  800 824 840 880  450 451 454 463 doublescan +hsync -vsync (55.4 kHz d)
[    10.233] (II) modeset(0): Modeline "720x480"x60.0   27.03  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    10.233] (II) modeset(0): Modeline "720x480"x59.9   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    10.233] (II) modeset(0): Modeline "640x512"x75.0   67.50  640 648 720 844  512 512 514 533 doublescan +hsync +vsync (80.0 kHz d)
[    10.233] (II) modeset(0): Modeline "640x512"x60.0   54.00  640 664 720 844  512 512 514 533 doublescan +hsync +vsync (64.0 kHz d)
[    10.233] (II) modeset(0): Modeline "700x450"x60.0   51.75  700 740 812 924  450 451 456 467 doublescan -hsync +vsync (56.0 kHz d)
[    10.233] (II) modeset(0): Modeline "700x450"x59.9   43.25  700 724 740 780  450 451 456 463 doublescan +hsync -vsync (55.4 kHz d)
[    10.233] (II) modeset(0): Modeline "640x480"x60.0   54.00  640 688 744 900  480 480 482 500 doublescan +hsync +vsync (60.0 kHz d)
[    10.233] (II) modeset(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    10.233] (II) modeset(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz e)
[    10.233] (II) modeset(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz d)
[    10.233] (II) modeset(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[    10.233] (II) modeset(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    10.233] (II) modeset(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    10.233] (II) modeset(0): Modeline "720x405"x59.5   22.50  720 744 808 896  405 408 413 422 -hsync +vsync (25.1 kHz d)
[    10.233] (II) modeset(0): Modeline "720x405"x59.0   21.75  720 768 800 880  405 408 413 419 +hsync -vsync (24.7 kHz d)
[    10.233] (II) modeset(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    10.233] (II) modeset(0): Modeline "684x384"x59.9   42.62  684 720 788 892  384 385 390 399 doublescan -hsync +vsync (47.8 kHz d)
[    10.233] (II) modeset(0): Modeline "684x384"x59.9   36.12  684 708 724 764  384 385 390 395 doublescan +hsync -vsync (47.3 kHz d)
[    10.233] (II) modeset(0): Modeline "640x400"x59.9   41.75  640 676 740 840  400 401 404 415 doublescan -hsync +vsync (49.7 kHz d)
[    10.233] (II) modeset(0): Modeline "640x400"x60.0   35.50  640 664 680 720  400 401 404 411 doublescan +hsync -vsync (49.3 kHz d)
[    10.233] (II) modeset(0): Modeline "576x432"x75.0   54.00  576 608 672 800  432 432 434 450 doublescan +hsync +vsync (67.5 kHz d)
[    10.233] (II) modeset(0): Modeline "640x360"x59.9   37.25  640 672 736 832  360 361 364 374 doublescan -hsync +vsync (44.8 kHz d)
[    10.233] (II) modeset(0): Modeline "640x360"x59.8   31.88  640 664 680 720  360 361 364 370 doublescan +hsync -vsync (44.3 kHz d)
[    10.233] (II) modeset(0): Modeline "640x360"x59.8   18.00  640 664 720 800  360 363 368 376 -hsync +vsync (22.5 kHz d)
[    10.233] (II) modeset(0): Modeline "640x360"x59.3   17.75  640 688 720 800  360 363 368 374 +hsync -vsync (22.2 kHz d)
[    10.233] (II) modeset(0): Modeline "512x384"x75.0   39.38  512 520 568 656  384 384 386 400 doublescan +hsync +vsync (60.0 kHz d)
[    10.233] (II) modeset(0): Modeline "512x384"x70.1   37.50  512 524 592 664  384 385 388 403 doublescan -hsync -vsync (56.5 kHz d)
[    10.233] (II) modeset(0): Modeline "512x384"x60.0   32.50  512 524 592 672  384 385 388 403 doublescan -hsync -vsync (48.4 kHz d)
[    10.233] (II) modeset(0): Modeline "512x288"x60.0   23.25  512 532 580 648  288 289 292 299 doublescan -hsync +vsync (35.9 kHz d)
[    10.233] (II) modeset(0): Modeline "512x288"x59.9   21.00  512 536 552 592  288 289 292 296 doublescan +hsync -vsync (35.5 kHz d)
[    10.233] (II) modeset(0): Modeline "416x312"x74.7   28.64  416 432 464 576  312 312 314 333 doublescan -hsync -vsync (49.7 kHz d)
[    10.233] (II) modeset(0): Modeline "480x270"x59.6   20.38  480 496 544 608  270 271 274 281 doublescan -hsync +vsync (33.5 kHz d)
[    10.233] (II) modeset(0): Modeline "480x270"x59.8   18.62  480 504 520 560  270 271 274 278 doublescan +hsync -vsync (33.3 kHz d)
[    10.233] (II) modeset(0): Modeline "400x300"x72.2   25.00  400 428 488 520  300 318 321 333 doublescan +hsync +vsync (48.1 kHz d)
[    10.233] (II) modeset(0): Modeline "400x300"x75.1   24.75  400 408 448 528  300 300 302 312 doublescan +hsync +vsync (46.9 kHz d)
[    10.233] (II) modeset(0): Modeline "400x300"x60.3   20.00  400 420 484 528  300 300 302 314 doublescan +hsync +vsync (37.9 kHz d)
[    10.233] (II) modeset(0): Modeline "400x300"x56.3   18.00  400 412 448 512  300 300 301 312 doublescan +hsync +vsync (35.2 kHz d)
[    10.233] (II) modeset(0): Modeline "432x243"x59.9   16.25  432 444 484 536  243 244 247 253 doublescan -hsync +vsync (30.3 kHz d)
[    10.233] (II) modeset(0): Modeline "432x243"x59.6   15.25  432 456 472 512  243 244 247 250 doublescan +hsync -vsync (29.8 kHz d)
[    10.233] (II) modeset(0): Modeline "320x240"x72.8   15.75  320 332 352 416  240 244 246 260 doublescan -hsync -vsync (37.9 kHz d)
[    10.233] (II) modeset(0): Modeline "320x240"x75.0   15.75  320 328 360 420  240 240 242 250 doublescan -hsync -vsync (37.5 kHz d)
[    10.233] (II) modeset(0): Modeline "320x240"x60.1   12.59  320 328 376 400  240 245 246 262 doublescan -hsync -vsync (31.5 kHz d)
[    10.233] (II) modeset(0): Modeline "360x202"x59.5   11.25  360 372 404 448  202 204 206 211 doublescan -hsync +vsync (25.1 kHz d)
[    10.233] (II) modeset(0): Modeline "360x202"x59.1   10.88  360 384 400 440  202 204 206 209 doublescan +hsync -vsync (24.7 kHz d)
[    10.233] (II) modeset(0): Modeline "320x180"x59.8    9.00  320 332 360 400  180 181 184 188 doublescan -hsync +vsync (22.5 kHz d)
[    10.233] (II) modeset(0): Modeline "320x180"x59.3    8.88  320 344 360 400  180 181 184 187 doublescan +hsync -vsync (22.2 kHz d)
[    10.266] (II) modeset(0): EDID for output DP-2
[    10.267] (II) modeset(0): EDID for output HDMI-1
[    10.268] (II) modeset(0): EDID for output HDMI-2
[    10.268] (II) modeset(0): Output DVI-D-1 disconnected
[    10.268] (II) modeset(0): Output DP-1 connected
[    10.268] (II) modeset(0): Output DP-2 disconnected
[    10.268] (II) modeset(0): Output HDMI-1 disconnected
[    10.268] (II) modeset(0): Output HDMI-2 disconnected
[    10.268] (II) modeset(0): Using exact sizes for initial modes
[    10.268] (II) modeset(0): Output DP-1 using initial mode 3840x2160 +0+0
[    10.268] (==) modeset(0): Using gamma correction (1.0, 1.0, 1.0)
[    10.268] (==) modeset(0): DPI set to (96, 96)
[    10.268] (II) Loading sub module "fb"
[    10.268] (II) LoadModule: "fb"
[    10.268] (II) Loading /usr/lib64/xorg/modules/libfb.so
[    10.269] (II) Module fb: vendor="X.Org Foundation"
[    10.269] 	compiled for 1.20.9, module version = 1.0.0
[    10.269] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    10.269] (II) UnloadModule: "fbdev"
[    10.269] (II) Unloading fbdev
[    10.269] (II) UnloadSubModule: "fbdevhw"
[    10.269] (II) Unloading fbdevhw
[    10.269] (II) UnloadModule: "vesa"
[    10.269] (II) Unloading vesa
[    10.299] (==) modeset(0): Backing store enabled
[    10.299] (==) modeset(0): Silken mouse enabled
[    10.304] (II) modeset(0): Initializing kms color map for depth 24, 8 bpc.
[    10.304] (==) modeset(0): DPMS enabled
[    10.304] (II) modeset(0): [DRI2] Setup complete
[    10.304] (II) modeset(0): [DRI2]   DRI driver: nouveau
[    10.304] (II) modeset(0): [DRI2]   VDPAU driver: nouveau
[    10.304] (II) Initializing extension Generic Event Extension
[    10.304] (II) Initializing extension SHAPE
[    10.304] (II) Initializing extension MIT-SHM
[    10.304] (II) Initializing extension XInputExtension
[    10.304] (II) Initializing extension XTEST
[    10.304] (II) Initializing extension BIG-REQUESTS
[    10.305] (II) Initializing extension SYNC
[    10.305] (II) Initializing extension XKEYBOARD
[    10.305] (II) Initializing extension XC-MISC
[    10.305] (II) Initializing extension SECURITY
[    10.305] (II) Initializing extension XFIXES
[    10.305] (II) Initializing extension RENDER
[    10.305] (II) Initializing extension RANDR
[    10.305] (II) Initializing extension COMPOSITE
[    10.305] (II) Initializing extension DAMAGE
[    10.305] (II) Initializing extension MIT-SCREEN-SAVER
[    10.305] (II) Initializing extension DOUBLE-BUFFER
[    10.305] (II) Initializing extension RECORD
[    10.305] (II) Initializing extension DPMS
[    10.306] (II) Initializing extension Present
[    10.306] (II) Initializing extension DRI3
[    10.306] (II) Initializing extension X-Resource
[    10.306] (II) Initializing extension XVideo
[    10.306] (II) Initializing extension XVideo-MotionCompensation
[    10.306] (II) Initializing extension SELinux
[    10.306] (II) SELinux: Disabled by boolean
[    10.306] (II) Initializing extension GLX
[    10.309] (II) AIGLX: Loaded and initialized nouveau
[    10.309] (II) GLX: Initialized DRI2 GL provider for screen 0
[    10.309] (II) Initializing extension XFree86-VidModeExtension
[    10.309] (II) Initializing extension XFree86-DGA
[    10.309] (II) Initializing extension XFree86-DRI
[    10.309] (II) Initializing extension DRI2
[    10.311] (II) modeset(0): Damage tracking initialized
[    10.311] (II) modeset(0): Setting screen physical size to 1016 x 571
[    10.371] (II) config/udev: Adding input device Power Button (/dev/input/event2)
[    10.371] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    10.371] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[    10.371] (**) Power Button: Applying InputClass "system-keyboard"
[    10.371] (II) LoadModule: "libinput"
[    10.371] (II) Loading /usr/lib64/xorg/modules/input/libinput_drv.so
[    10.383] (II) Module libinput: vendor="X.Org Foundation"
[    10.383] 	compiled for 1.20.8, module version = 0.30.0
[    10.383] 	Module class: X.Org XInput Driver
[    10.383] 	ABI class: X.Org XInput driver, version 24.1
[    10.383] (II) Using input driver 'libinput' for 'Power Button'
[    10.383] (**) Power Button: always reports core events
[    10.383] (**) Option "Device" "/dev/input/event2"
[    10.383] (**) Option "_source" "server/udev"
[    10.393] (II) event2  - Power Button: is tagged by udev as: Keyboard
[    10.393] (II) event2  - Power Button: device is a keyboard
[    10.393] (II) event2  - Power Button: device removed
[    10.402] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input2/event2"
[    10.402] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 6)
[    10.402] (**) Option "xkb_layout" "dk"
[    10.421] (II) event2  - Power Button: is tagged by udev as: Keyboard
[    10.422] (II) event2  - Power Button: device is a keyboard
[    10.422] (II) config/udev: Adding input device Power Button (/dev/input/event1)
[    10.422] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    10.422] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[    10.422] (**) Power Button: Applying InputClass "system-keyboard"
[    10.422] (II) Using input driver 'libinput' for 'Power Button'
[    10.422] (**) Power Button: always reports core events
[    10.422] (**) Option "Device" "/dev/input/event1"
[    10.422] (**) Option "_source" "server/udev"
[    10.424] (II) event1  - Power Button: is tagged by udev as: Keyboard
[    10.424] (II) event1  - Power Button: device is a keyboard
[    10.424] (II) event1  - Power Button: device removed
[    10.435] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1/event1"
[    10.435] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 7)
[    10.435] (**) Option "xkb_layout" "dk"
[    10.436] (II) event1  - Power Button: is tagged by udev as: Keyboard
[    10.436] (II) event1  - Power Button: device is a keyboard
[    10.437] (II) config/udev: Adding input device Sleep Button (/dev/input/event0)
[    10.437] (**) Sleep Button: Applying InputClass "evdev keyboard catchall"
[    10.437] (**) Sleep Button: Applying InputClass "libinput keyboard catchall"
[    10.437] (**) Sleep Button: Applying InputClass "system-keyboard"
[    10.437] (II) Using input driver 'libinput' for 'Sleep Button'
[    10.437] (**) Sleep Button: always reports core events
[    10.437] (**) Option "Device" "/dev/input/event0"
[    10.437] (**) Option "_source" "server/udev"
[    10.438] (II) event0  - Sleep Button: is tagged by udev as: Keyboard
[    10.438] (II) event0  - Sleep Button: device is a keyboard
[    10.438] (II) event0  - Sleep Button: device removed
[    10.447] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input0/event0"
[    10.447] (II) XINPUT: Adding extended input device "Sleep Button" (type: KEYBOARD, id 8)
[    10.447] (**) Option "xkb_layout" "dk"
[    10.448] (II) event0  - Sleep Button: is tagged by udev as: Keyboard
[    10.448] (II) event0  - Sleep Button: device is a keyboard
[    10.449] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=7 (/dev/input/event10)
[    10.449] (II) No input driver specified, ignoring this device.
[    10.449] (II) This device may have been added with another device file.
[    10.450] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=8 (/dev/input/event11)
[    10.450] (II) No input driver specified, ignoring this device.
[    10.450] (II) This device may have been added with another device file.
[    10.450] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=9 (/dev/input/event12)
[    10.450] (II) No input driver specified, ignoring this device.
[    10.450] (II) This device may have been added with another device file.
[    10.451] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=10 (/dev/input/event13)
[    10.451] (II) No input driver specified, ignoring this device.
[    10.451] (II) This device may have been added with another device file.
[    10.451] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=11 (/dev/input/event14)
[    10.451] (II) No input driver specified, ignoring this device.
[    10.451] (II) This device may have been added with another device file.
[    10.452] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=12 (/dev/input/event15)
[    10.452] (II) No input driver specified, ignoring this device.
[    10.452] (II) This device may have been added with another device file.
[    10.452] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=3 (/dev/input/event9)
[    10.452] (II) No input driver specified, ignoring this device.
[    10.452] (II) This device may have been added with another device file.
[    10.453] (II) config/udev: Adding input device Microsoft Wired Keyboard 600 (/dev/input/event4)
[    10.453] (**) Microsoft Wired Keyboard 600: Applying InputClass "evdev keyboard catchall"
[    10.453] (**) Microsoft Wired Keyboard 600: Applying InputClass "libinput keyboard catchall"
[    10.453] (**) Microsoft Wired Keyboard 600: Applying InputClass "system-keyboard"
[    10.453] (II) Using input driver 'libinput' for 'Microsoft Wired Keyboard 600'
[    10.453] (**) Microsoft Wired Keyboard 600: always reports core events
[    10.453] (**) Option "Device" "/dev/input/event4"
[    10.453] (**) Option "_source" "server/udev"
[    10.455] (II) event4  - Microsoft Wired Keyboard 600: is tagged by udev as: Keyboard
[    10.455] (II) event4  - Microsoft Wired Keyboard 600: device is a keyboard
[    10.456] (II) event4  - Microsoft Wired Keyboard 600: device removed
[    10.463] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.0/0003:045E:07F8.0002/input/input4/event4"
[    10.463] (II) XINPUT: Adding extended input device "Microsoft Wired Keyboard 600" (type: KEYBOARD, id 9)
[    10.463] (**) Option "xkb_layout" "dk"
[    10.465] (II) event4  - Microsoft Wired Keyboard 600: is tagged by udev as: Keyboard
[    10.465] (II) event4  - Microsoft Wired Keyboard 600: device is a keyboard
[    10.466] (II) config/udev: Adding input device Microsoft Wired Keyboard 600 Consumer Control (/dev/input/event5)
[    10.466] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "evdev keyboard catchall"
[    10.466] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "libinput keyboard catchall"
[    10.466] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "system-keyboard"
[    10.466] (II) Using input driver 'libinput' for 'Microsoft Wired Keyboard 600 Consumer Control'
[    10.466] (**) Microsoft Wired Keyboard 600 Consumer Control: always reports core events
[    10.466] (**) Option "Device" "/dev/input/event5"
[    10.466] (**) Option "_source" "server/udev"
[    10.468] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: is tagged by udev as: Keyboard
[    10.469] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: device is a keyboard
[    10.469] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: device removed
[    10.479] (II) libinput: Microsoft Wired Keyboard 600 Consumer Control: needs a virtual subdevice
[    10.479] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.1/0003:045E:07F8.0003/input/input5/event5"
[    10.479] (II) XINPUT: Adding extended input device "Microsoft Wired Keyboard 600 Consumer Control" (type: MOUSE, id 10)
[    10.479] (**) Option "AccelerationScheme" "none"
[    10.479] (**) Microsoft Wired Keyboard 600 Consumer Control: (accel) selected scheme none/0
[    10.479] (**) Microsoft Wired Keyboard 600 Consumer Control: (accel) acceleration factor: 2.000
[    10.479] (**) Microsoft Wired Keyboard 600 Consumer Control: (accel) acceleration threshold: 4
[    10.481] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: is tagged by udev as: Keyboard
[    10.481] (II) event5  - Microsoft Wired Keyboard 600 Consumer Control: device is a keyboard
[    10.482] (II) config/udev: Adding input device Microsoft Wired Keyboard 600 System Control (/dev/input/event6)
[    10.482] (**) Microsoft Wired Keyboard 600 System Control: Applying InputClass "evdev keyboard catchall"
[    10.482] (**) Microsoft Wired Keyboard 600 System Control: Applying InputClass "libinput keyboard catchall"
[    10.482] (**) Microsoft Wired Keyboard 600 System Control: Applying InputClass "system-keyboard"
[    10.482] (II) Using input driver 'libinput' for 'Microsoft Wired Keyboard 600 System Control'
[    10.482] (**) Microsoft Wired Keyboard 600 System Control: always reports core events
[    10.482] (**) Option "Device" "/dev/input/event6"
[    10.482] (**) Option "_source" "server/udev"
[    10.484] (II) event6  - Microsoft Wired Keyboard 600 System Control: is tagged by udev as: Keyboard
[    10.484] (II) event6  - Microsoft Wired Keyboard 600 System Control: device is a keyboard
[    10.485] (II) event6  - Microsoft Wired Keyboard 600 System Control: device removed
[    10.495] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.1/0003:045E:07F8.0003/input/input6/event6"
[    10.495] (II) XINPUT: Adding extended input device "Microsoft Wired Keyboard 600 System Control" (type: KEYBOARD, id 11)
[    10.495] (**) Option "xkb_layout" "dk"
[    10.497] (II) event6  - Microsoft Wired Keyboard 600 System Control: is tagged by udev as: Keyboard
[    10.497] (II) event6  - Microsoft Wired Keyboard 600 System Control: device is a keyboard
[    10.498] (II) config/udev: Adding input device Logitech USB-PS/2 Optical Mouse (/dev/input/event3)
[    10.498] (**) Logitech USB-PS/2 Optical Mouse: Applying InputClass "evdev pointer catchall"
[    10.498] (**) Logitech USB-PS/2 Optical Mouse: Applying InputClass "libinput pointer catchall"
[    10.498] (II) Using input driver 'libinput' for 'Logitech USB-PS/2 Optical Mouse'
[    10.498] (**) Logitech USB-PS/2 Optical Mouse: always reports core events
[    10.498] (**) Option "Device" "/dev/input/event3"
[    10.498] (**) Option "_source" "server/udev"
[    10.554] (II) event3  - Logitech USB-PS/2 Optical Mouse: is tagged by udev as: Mouse
[    10.554] (II) event3  - Logitech USB-PS/2 Optical Mouse: device is a pointer
[    10.555] (II) event3  - Logitech USB-PS/2 Optical Mouse: device removed
[    10.572] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/0003:046D:C051.0001/input/input3/event3"
[    10.572] (II) XINPUT: Adding extended input device "Logitech USB-PS/2 Optical Mouse" (type: MOUSE, id 12)
[    10.572] (**) Option "AccelerationScheme" "none"
[    10.572] (**) Logitech USB-PS/2 Optical Mouse: (accel) selected scheme none/0
[    10.572] (**) Logitech USB-PS/2 Optical Mouse: (accel) acceleration factor: 2.000
[    10.572] (**) Logitech USB-PS/2 Optical Mouse: (accel) acceleration threshold: 4
[    10.629] (II) event3  - Logitech USB-PS/2 Optical Mouse: is tagged by udev as: Mouse
[    10.629] (II) event3  - Logitech USB-PS/2 Optical Mouse: device is a pointer
[    10.632] (II) config/udev: Adding input device Logitech USB-PS/2 Optical Mouse (/dev/input/mouse0)
[    10.632] (II) No input driver specified, ignoring this device.
[    10.632] (II) This device may have been added with another device file.
[    10.633] (II) config/udev: Adding input device HDA Intel PCH Front Mic (/dev/input/event16)
[    10.633] (II) No input driver specified, ignoring this device.
[    10.633] (II) This device may have been added with another device file.
[    10.634] (II) config/udev: Adding input device HDA Intel PCH Rear Mic (/dev/input/event17)
[    10.634] (II) No input driver specified, ignoring this device.
[    10.634] (II) This device may have been added with another device file.
[    10.635] (II) config/udev: Adding input device HDA Intel PCH Line (/dev/input/event18)
[    10.635] (II) No input driver specified, ignoring this device.
[    10.635] (II) This device may have been added with another device file.
[    10.637] (II) config/udev: Adding input device HDA Intel PCH Line Out (/dev/input/event19)
[    10.637] (II) No input driver specified, ignoring this device.
[    10.637] (II) This device may have been added with another device file.
[    10.638] (II) config/udev: Adding input device HDA Intel PCH Front Headphone (/dev/input/event20)
[    10.638] (II) No input driver specified, ignoring this device.
[    10.638] (II) This device may have been added with another device file.
[    10.639] (II) config/udev: Adding input device Eee PC WMI hotkeys (/dev/input/event8)
[    10.639] (**) Eee PC WMI hotkeys: Applying InputClass "evdev keyboard catchall"
[    10.639] (**) Eee PC WMI hotkeys: Applying InputClass "libinput keyboard catchall"
[    10.639] (**) Eee PC WMI hotkeys: Applying InputClass "system-keyboard"
[    10.639] (II) Using input driver 'libinput' for 'Eee PC WMI hotkeys'
[    10.639] (**) Eee PC WMI hotkeys: always reports core events
[    10.639] (**) Option "Device" "/dev/input/event8"
[    10.639] (**) Option "_source" "server/udev"
[    10.642] (II) event8  - Eee PC WMI hotkeys: is tagged by udev as: Keyboard
[    10.642] (II) event8  - Eee PC WMI hotkeys: device is a keyboard
[    10.643] (II) event8  - Eee PC WMI hotkeys: device removed
[    10.660] (**) Option "config_info" "udev:/sys/devices/platform/eeepc-wmi/input/input8/event8"
[    10.660] (II) XINPUT: Adding extended input device "Eee PC WMI hotkeys" (type: KEYBOARD, id 13)
[    10.660] (**) Option "xkb_layout" "dk"
[    10.663] (II) event8  - Eee PC WMI hotkeys: is tagged by udev as: Keyboard
[    10.663] (II) event8  - Eee PC WMI hotkeys: device is a keyboard
[    10.665] (II) config/udev: Adding input device PC Speaker (/dev/input/event7)
[    10.665] (II) No input driver specified, ignoring this device.
[    10.665] (II) This device may have been added with another device file.
[    10.685] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "evdev keyboard catchall"
[    10.685] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "libinput keyboard catchall"
[    10.685] (**) Microsoft Wired Keyboard 600 Consumer Control: Applying InputClass "system-keyboard"
[    10.685] (II) Using input driver 'libinput' for 'Microsoft Wired Keyboard 600 Consumer Control'
[    10.685] (**) Microsoft Wired Keyboard 600 Consumer Control: always reports core events
[    10.685] (**) Option "Device" "/dev/input/event5"
[    10.685] (**) Option "_source" "_driver/libinput"
[    10.685] (II) libinput: Microsoft Wired Keyboard 600 Consumer Control: is a virtual subdevice
[    10.685] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:14.0/usb1/1-12/1-12:1.1/0003:045E:07F8.0003/input/input5/event5"
[    10.685] (II) XINPUT: Adding extended input device "Microsoft Wired Keyboard 600 Consumer Control" (type: KEYBOARD, id 14)
[    10.685] (**) Option "xkb_layout" "dk"
[    11.972] (II) modeset(0): Disabling kernel dirty updates, not required.
[    20.771] (II) modeset(0): EDID vendor "PHL", prod id 2298
[    20.771] (II) modeset(0): Using EDID range info for horizontal sync
[    20.771] (II) modeset(0): Using EDID range info for vertical refresh
[    20.771] (II) modeset(0): Printing DDC gathered Modelines:
[    20.771] (II) modeset(0): Modeline "3840x2160"x0.0  533.25  3840 3888 3920 4000  2160 2163 2168 2222 +hsync -vsync (133.3 kHz eP)
[    20.771] (II) modeset(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync +vsync (88.8 kHz e)
[    20.771] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    20.771] (II) modeset(0): Modeline "720x480"x0.0   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    20.771] (II) modeset(0): Modeline "720x576"x0.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[    20.771] (II) modeset(0): Modeline "1920x2160"x0.0  277.25  1920 1968 2000 2080  2160 2163 2173 2222 +hsync -vsync (133.3 kHz e)
[    20.771] (II) modeset(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    20.771] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    20.771] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    20.771] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    20.771] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[    20.771] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[    20.771] (II) modeset(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    20.771] (II) modeset(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    20.771] (II) modeset(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    20.771] (II) modeset(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz e)
[    20.771] (II) modeset(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[    20.771] (II) modeset(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    20.771] (II) modeset(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    20.771] (II) modeset(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    20.771] (II) modeset(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    20.771] (II) modeset(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    20.771] (II) modeset(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[    20.771] (II) modeset(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    20.771] (II) modeset(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[    20.771] (II) modeset(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz e)
[    20.771] (II) modeset(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz e)
[    20.771] (II) modeset(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    20.771] (II) modeset(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    20.772] (--) modeset(0): HDMI max TMDS frequency 600000KHz
[    21.233] (II) modeset(0): EDID vendor "PHL", prod id 2298
[    21.233] (II) modeset(0): Using hsync ranges from config file
[    21.233] (II) modeset(0): Using vrefresh ranges from config file
[    21.233] (II) modeset(0): Printing DDC gathered Modelines:
[    21.233] (II) modeset(0): Modeline "3840x2160"x0.0  533.25  3840 3888 3920 4000  2160 2163 2168 2222 +hsync -vsync (133.3 kHz eP)
[    21.233] (II) modeset(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync +vsync (88.8 kHz e)
[    21.233] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    21.233] (II) modeset(0): Modeline "720x480"x0.0   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    21.233] (II) modeset(0): Modeline "720x576"x0.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[    21.233] (II) modeset(0): Modeline "1920x2160"x0.0  277.25  1920 1968 2000 2080  2160 2163 2173 2222 +hsync -vsync (133.3 kHz e)
[    21.233] (II) modeset(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    21.233] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    21.233] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    21.233] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    21.233] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[    21.233] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[    21.233] (II) modeset(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    21.233] (II) modeset(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    21.233] (II) modeset(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    21.233] (II) modeset(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz e)
[    21.233] (II) modeset(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[    21.233] (II) modeset(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    21.233] (II) modeset(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    21.233] (II) modeset(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    21.233] (II) modeset(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    21.233] (II) modeset(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    21.233] (II) modeset(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[    21.233] (II) modeset(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    21.233] (II) modeset(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[    21.233] (II) modeset(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz e)
[    21.233] (II) modeset(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz e)
[    21.233] (II) modeset(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    21.233] (II) modeset(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    21.233] (--) modeset(0): HDMI max TMDS frequency 600000KHz
[    21.311] (II) modeset(0): EDID vendor "PHL", prod id 2298
[    21.311] (II) modeset(0): Using hsync ranges from config file
[    21.311] (II) modeset(0): Using vrefresh ranges from config file
[    21.311] (II) modeset(0): Printing DDC gathered Modelines:
[    21.311] (II) modeset(0): Modeline "3840x2160"x0.0  533.25  3840 3888 3920 4000  2160 2163 2168 2222 +hsync -vsync (133.3 kHz eP)
[    21.311] (II) modeset(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640 2720  1440 1443 1448 1481 +hsync +vsync (88.8 kHz e)
[    21.311] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    21.311] (II) modeset(0): Modeline "720x480"x0.0   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    21.311] (II) modeset(0): Modeline "720x576"x0.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[    21.311] (II) modeset(0): Modeline "1920x2160"x0.0  277.25  1920 1968 2000 2080  2160 2163 2173 2222 +hsync -vsync (133.3 kHz e)
[    21.311] (II) modeset(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    21.311] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    21.311] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    21.311] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    21.311] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[    21.311] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz e)
[    21.311] (II) modeset(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    21.311] (II) modeset(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    21.311] (II) modeset(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    21.311] (II) modeset(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz e)
[    21.311] (II) modeset(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[    21.311] (II) modeset(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    21.311] (II) modeset(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    21.311] (II) modeset(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    21.311] (II) modeset(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    21.311] (II) modeset(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    21.311] (II) modeset(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[    21.311] (II) modeset(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    21.311] (II) modeset(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[    21.311] (II) modeset(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz e)
[    21.311] (II) modeset(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz e)
[    21.311] (II) modeset(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    21.311] (II) modeset(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    21.311] (--) modeset(0): HDMI max TMDS frequency 600000KHz
[    28.980] (EE) event3  - Logitech USB-PS/2 Optical Mouse: client bug: event processing lagging behind by 14ms, your system is too slow

---

When in doubt, blame nouveau.

I believe there has been some recent work around adjusting the logic
which checks that modes have enough bandwidth. Adding Lyude, who
worked on these changes. Not sure when they landed.

Klaus -- please supply a full Xorg log.

Cheers,

  -ilia

On Sun, Nov 29, 2020 at 4:28 PM Klaus Ebbe Grue <grue@di.ku.dk> wrote:
>
> Hi nouveau@lists.freedesktop.org
>
> My X-server gives a blank screen on Fedora kernel 5.9.9.
>
> I am in doubt whether or not I should blame Nouveau for that.
>
> I know the nvidea drivers have problems with Fedora kernel 5.9.9.
>
> I can file a bug against Nouveau and provide logs if you think there is a remote chance that Nouveau could be the cause.
>
> Here are some details:
>
> Fedora 5.8.18 / X-server works fine.
>
> I can boot into Fedora 5.9.9 runlevel 3 (no X-server).
>
> If I boot into Fedora 5.9.9 runlevel 5 (with X-server), the screen powers off instead of giving a login prompt, but apart from that, Fedora 5.9.9 works fine and produces log files.
>
> If I then power off and boot into Fedora 5.8.18 and read Xorg.0.log.old I can see that the X-server under Fedora 5.9.9 did not get the screen resolutions right.
>
> Here is what monitor-edid says under both Fedora 5.9.9 and 5.8.18:
>
> > monitor-edid
> Name: PHL BDM4350
> EISA ID: PHL08fa
> EDID version: 1.4
> EDID extension blocks: 1
> Screen size: 95.3 cm x 54.3 cm (43.18 inches, aspect ratio 16/9 = 1.76)
> Gamma: 2.2
> Digital signal
> Max video bandwidth: 600 MHz
>         HorizSync 30-160
>         VertRefresh 23-80
>         # Monitor preferred modeline (60.0 Hz vsync, 133.3 kHz hsync, ratio 16/9, 102 dpi) (bad ratio)
>         ModeLine "3840x2160" 533.25 3840 3888 3920 4000 2160 2163 2168 2222 -hsync +vsync
> ...
>
> But under Fedora 5.9.9, the X-server is unaware of the 3840x2160 resolution according to Xorg.0.log.old. It also gets the screen physical size wrong.
>
> My first cry of help is here:
> https://eur02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fask.fedoraproject.org%2Ft%2Fno-login-screen-after-upgrade%2F10618&amp;data=04%7C01%7Cgrue%40di.ku.dk%7C0637ee7c8bb3480bba1408d894ba89f8%7Ca3927f91cda14696af898c9f1ceffa91%7C0%7C0%7C637422876200174114%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=23fitIQ5FGaFHqcjuvirPt0pDTYnwu0VntIGaXlKrco%3D&amp;reserved=0
> That is where I leaned that the nvidea drivers have problems with Fedora 5.9.9
>
> Cheers,
> Klaus
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://eur02.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fnouveau&amp;data=04%7C01%7Cgrue%40di.ku.dk%7C0637ee7c8bb3480bba1408d894ba89f8%7Ca3927f91cda14696af898c9f1ceffa91%7C0%7C0%7C637422876200174114%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=FfQago8Ygj%2BHB%2FvLC%2B0keCV%2BK61TWIZ7ipvc5tS8TW8%3D&amp;reserved=0
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

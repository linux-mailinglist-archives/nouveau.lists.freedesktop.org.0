Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D701B8355
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA01B6EB8D;
	Sat, 25 Apr 2020 02:52:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFB689D86
 for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2020 18:56:25 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id i19so966167wmb.0
 for <nouveau@lists.freedesktop.org>; Wed, 01 Apr 2020 11:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=3hYV76fZm8OAgHl3Xw4yPjsicYSLthZodJ0PGLgDMqk=;
 b=jQcQOZyly2en0d4tvM6GwNNWnAnCmBQ7Dk/NxhEYzq1VJtApwiKMBuXymdEbfVZN/O
 HzBlukCg9+2vc7zdoUr9dCd+XmI111jqzha3hCTwEL6sQAnamKJTvxsEnnHQGaxfv8G1
 G4+S3AujUPSAbRSpPmjZRRmZ73ZGglO0ggl9TBJfEMuyzVgCBeNorhIHuoFjf4MmfOjY
 2WIRdJJDbiC1VcPrI6hcLLANl2yi4RO0sjKE6YBhU05YEtRyHbNQFHIYc7HIo+Zhj6kR
 5XH7UP/6PIvONw0aPq1XUMA+PCt70As+uTkD7IwGsdXkXX7R3Kd4aud1QqGkntIZxiGQ
 eLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=3hYV76fZm8OAgHl3Xw4yPjsicYSLthZodJ0PGLgDMqk=;
 b=T8lelV7C42Ks2nACfy2Wdq0m1xSOyjl8NId2DPStiTU0cadT2My25iXSIh2hzN6KEk
 KCI6xd9aM4/x4D0cL8U3tmqiuIQXNV2T/VI0V3D6Eakq3vWwOQAh+eDlfKp+t7dems9Z
 KanqCOEkngZCrYEGfiOI3XBiwkXAO5LIfqdzxCBJJPeowbldZSExG3IOa2qtzo6AG6Nv
 RTouiKuJZP81w84WQWugOq01KhyJJ61Xr1Wo1DyJ5ox16Wz2/gHS339OlvYn52AfU1uG
 9p7rimF8MEcPQv8sfyC4FbUZ88504f9FGE+Dmal0vMOZhZl1T/p+o+B62Joly2sQCDYv
 VV1A==
X-Gm-Message-State: AGi0PuaU4TtEE/XZhlhErh35KVUvVBoTx5Y/BjngBV7OkXjcRCMbWfPW
 KR1BQpBb3LqPmBiCci44Eikeg8M=
X-Google-Smtp-Source: APiQypIzURG/sKvHcYtATN7pv/b6yArurIdsjLMWK93q6SsCHMZq/TsJF1BGsp/0X8Fh0SJRls00gw==
X-Received: by 2002:a1c:c302:: with SMTP id t2mr5690151wmf.4.1585767383545;
 Wed, 01 Apr 2020 11:56:23 -0700 (PDT)
Received: from avx2 ([46.53.252.11])
 by smtp.gmail.com with ESMTPSA id y200sm3723609wmc.20.2020.04.01.11.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 11:56:23 -0700 (PDT)
Date: Wed, 1 Apr 2020 21:56:21 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: nouveau@lists.freedesktop.org
Message-ID: <20200401185621.GA24692@avx2>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 25 Apr 2020 02:51:59 +0000
Subject: [Nouveau] gp104: regression on Linux 5.6
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
Cc: bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

gp104 refuses to switch to "graphic" mode and show anything past
this line:

	fb0: switching to nouveaufb from EFI VGA

Machine is fine, as it I can press Ctrl+Alt+Delete and reboot it
normally.

5.5 is OK. 5.6 is broken.
Bisecting is kinda painful with miscompilation and init/main.c breakage.

BTW do I need all those megabytes of firmware?

[    0.923273] fb0: switching to nouveaufb from EFI VGA
[    0.923440] nouveau 0000:02:00.0: NVIDIA GP104 (134000a1)
[    1.026681] nouveau 0000:02:00.0: bios: version 86.04.1e.00.01
[    1.026930] nouveau 0000:02:00.0: gr: failed to load firmware "gr/sw_nonctx"
[    1.026934] nouveau 0000:02:00.0: gr: failed to load gr/sw_nonctx
[    1.027196] nouveau 0000:02:00.0: fb: 8192 MiB GDDR5
[    1.040683] nouveau 0000:02:00.0: DRM: VRAM: 8192 MiB
[    1.040686] nouveau 0000:02:00.0: DRM: GART: 536870912 MiB
[    1.040689] nouveau 0000:02:00.0: DRM: BIT table 'A' not found
[    1.040692] nouveau 0000:02:00.0: DRM: BIT table 'L' not found
[    1.040695] nouveau 0000:02:00.0: DRM: TMDS table version 2.0
[    1.040698] nouveau 0000:02:00.0: DRM: DCB version 4.1
[    1.040701] nouveau 0000:02:00.0: DRM: DCB outp 00: 01000f42 00020030
[    1.040704] nouveau 0000:02:00.0: DRM: DCB outp 01: 04811f96 04600020
[    1.040707] nouveau 0000:02:00.0: DRM: DCB outp 02: 04011f92 00020020
[    1.040710] nouveau 0000:02:00.0: DRM: DCB outp 03: 04822f86 04600010
[    1.040713] nouveau 0000:02:00.0: DRM: DCB outp 04: 04022f82 00020010
[    1.040716] nouveau 0000:02:00.0: DRM: DCB outp 06: 02033f62 00020010
[    1.040718] nouveau 0000:02:00.0: DRM: DCB outp 07: 02844f76 04600020
[    1.040721] nouveau 0000:02:00.0: DRM: DCB outp 08: 02044f72 00020020
[    1.040724] nouveau 0000:02:00.0: DRM: DCB conn 00: 00001031
[    1.040727] nouveau 0000:02:00.0: DRM: DCB conn 01: 02000146
[    1.040729] nouveau 0000:02:00.0: DRM: DCB conn 02: 01000246
[    1.040732] nouveau 0000:02:00.0: DRM: DCB conn 03: 00010361
[    1.040734] nouveau 0000:02:00.0: DRM: DCB conn 04: 00020446
[    1.041003] nouveau 0000:02:00.0: DRM: failed to create kernel channel, -22
[    1.041145] nouveau 0000:02:00.0: DRM: MM: using COPY for buffer copies
[    1.322372] nouveau 0000:02:00.0: DRM: allocated 1920x1200 fb: 0x200000, bo 000000002ca87195
[    1.322442] fbcon: nouveaudrmfb (fb0) is primary device
[    1.646937] nouveau 0000:02:00.0: fb0: nouveaudrmfb frame buffer device
[    1.647186] [drm] Initialized nouveau 1.3.1 20120801 for 0000:02:00.0 on minor 0
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9F243F6D
	for <lists+nouveau@lfdr.de>; Thu, 13 Aug 2020 21:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F0D6E239;
	Thu, 13 Aug 2020 19:46:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9516C6E235
 for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2020 19:46:27 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id h19so7480657ljg.13
 for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2020 12:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=IQjQeKESH4Fux+qvpzbOR0a01G8vDmkOM7KwOMSxP/Q=;
 b=ER8DFv+p2MX7FOWMiSctza7xR24um2NN3jh3Ebs10pOtRJUPavTPRE2CKill865Hmg
 XGVVCU8MEIk4gDJrpOBqIMwNRMEpkUrImmuUE2QX+tC4r7ziREyXqS4JtndY6XVF4ols
 RMqnotPbSiyl/XpfWmi5G8R+fG2ECQJ9+YGtB6mduLtZEtuH14xkiIezDo+pam+prvpC
 ywVeIu7C170Vy1RnwSh90iw9WhKQ9WPz1G6NXmEkjuJ0uvJvBOz73Gm1V9HurZ7nKKoi
 eugFdz37XUNIFuo+KGFBEi/bZKGByZumSYaShlbjRA/IbFPWiydSPUh+80z7Pul5bk8p
 fM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:user-agent:mime-version
 :content-transfer-encoding:content-disposition:message-id;
 bh=IQjQeKESH4Fux+qvpzbOR0a01G8vDmkOM7KwOMSxP/Q=;
 b=m09dMWkAkfq/cHkk04mZPXG4xoFOJWEEEwW2w/Azd/Z+RMlaXi5K7N42zikgNKZ7LL
 UMs2TcKjLwrsy44uW5w5WuUCYSuk1LlDqoY1K5kideC4kT9+NjdasDFFDaFJ0wFqSOu6
 6Tvzuav/RrsvWFCwCPnJ+aRmdCo6UYXN3sTBXrAn3gpAlZm0stWOtFeH5P9JBOhauCB9
 vp2jrZhaZfpm6pyb7mNsIF7UmAIyEBh8w/5piNGXSNxc67TZp/xdtVxgPLCic3EcZa1M
 Qk6ka36jy9EVJlx6LFTKvAynpiHOmjlosl+PNQysKXlJNn21po+eTOVDb80+c+UJhwe5
 WVOw==
X-Gm-Message-State: AOAM530bZP9j4ir9QYrYCKNAulJbJvmJl6Dpdk7OZXP6rvzHf6DqqL+O
 i2ct0EC+45J8I9zRog58hndr1BBaJss=
X-Google-Smtp-Source: ABdhPJz2La2oomGa5TTF14Q38MSAT/42h8+gonpOc4udDD4DbOrbSeCkHQUomF4ZxyyK9Cqgall8zw==
X-Received: by 2002:a05:651c:c1:: with SMTP id 1mr2751083ljr.146.1597347985698; 
 Thu, 13 Aug 2020 12:46:25 -0700 (PDT)
Received: from [192.168.1.100] ([176.116.252.109])
 by smtp.gmail.com with ESMTPSA id s4sm1379798lfc.56.2020.08.13.12.46.24
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Aug 2020 12:46:25 -0700 (PDT)
From: Andrew Randrianasulu <randrianasulu@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 13 Aug 2020 22:37:14 +0300
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202008132237.14933.randrianasulu@gmail.com>
Subject: [Nouveau] assert in nouveau_vp3_video_vp.c ?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

here:

diff --git a/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c b/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
index 53f5db0003d..efd9cf2b004 100644
--- a/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
+++ b/src/gallium/drivers/nouveau/nouveau_vp3_video_vp.c
@@ -365,7 +365,7 @@ nouveau_vp3_fill_picparm_h264_vp(struct nouveau_vp3_decoder *dec,
       refs[j] = (struct nouveau_vp3_video_buffer *)d->ref[i];
       h->refs[j].fifo_idx = j + 1;
       h->refs[j].tmp_idx = refs[j]->valid_ref;
-      assert(dec->refs[refs[j]->valid_ref].vidbuf == refs[j]);
+//      assert(dec->refs[refs[j]->valid_ref].vidbuf == refs[j]);
       h->refs[j].field_order_cnt[0] = d->field_order_cnt_list[i][0];
       h->refs[j].field_order_cnt[1] = d->field_order_cnt_list[i][1];
       h->refs[j].frame_idx = d->frame_num_list[i];

what exactly it was supposed to prevent? I removed it just for testing, and now
CinelerraGG from https://git.cinelerra-gg.org/git/?p=goodguy/cinelerra.git;a=summary
(at 
commit a6fa7638ac79011ab3188e1f4120680c641cca52 (HEAD -> master, origin/master, origin/HEAD)
Author: Good Guy <good1.2guy@gmail.com>
Date:   Sun Aug 9 17:51:03 2020 -0600

    cut with active speed auto correction, add locale pref, mod prores dft profile to hq, change loadmode default to replace, tweak click operation defaults
)

loads h264 files in vdpau mode instead of asserting ...

But may be it will mess up things differently .....

I also run into this error:

[ 5486.914351] nouveau 0000:01:00.0: disp: ERROR 1 [PUSHBUFFER_ERR] 02 [] chid 0 mthd 0000 data 00000400
[ 5488.914339] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5494.140509] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5496.144313] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5498.220935] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5500.232161] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5502.263648] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5504.270297] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5508.419092] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5526.915696] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5529.684062] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5531.686719] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5534.222355] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5536.225058] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5538.671503] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5540.678049] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5598.327491] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5600.327512] nouveau 0000:01:00.0: DRM: base-0: timeout
[ 5620.904307] nouveau 0000:01:00.0: DRM: base-0: timeout
[ 5622.904461] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5624.904938] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5626.937565] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5637.982055] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5639.985649] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5647.682404] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5649.689416] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5653.303186] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5655.317506] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 5657.646852] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6043.423417] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6045.647408] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6047.828123] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6052.566656] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6054.572658] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6057.454686] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6059.459471] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6061.478374] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6063.483032] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6065.498513] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6067.503851] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6069.538260] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6071.548000] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6077.351989] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6079.364318] nouveau 0000:01:00.0: DRM: core notifier timeout
[ 6081.420916] nouveau 0000:01:00.0: DRM: core notifier timeout

on linus's master, now everything is pausing for some seconds :}

Time to reboot and see if old kernel (5.6.12) will fare better .with new mesa build ...
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

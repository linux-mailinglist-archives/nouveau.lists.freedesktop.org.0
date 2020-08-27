Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0402559C8
	for <lists+nouveau@lfdr.de>; Fri, 28 Aug 2020 14:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4485A6E4A6;
	Fri, 28 Aug 2020 12:05:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967296E0F1
 for <nouveau@lists.freedesktop.org>; Thu, 27 Aug 2020 18:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598553460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=GIOyNKn4lpZbuj6L4tBDqNoHcELuwP+YTy/cWEhcVsA=;
 b=JJ95u4tjzCSeLXoJt/ZlBUmhmsqanl5FAz2heLehmHrSoZlD16ZWqK9wraCrmoOis/yfXy
 trCxy5Q8/+hOmT8siwOg5tjt5ACfx3sXwayt9uFoJmdj4KRxz9B/mS7oe5x0lf//06uHoC
 vZs+5NLHO9zP8hj7TDJM+Ae+ZF+Q5vM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-xa0LkmRJMqC0NXb3l8CCTg-1; Thu, 27 Aug 2020 14:37:38 -0400
X-MC-Unique: xa0LkmRJMqC0NXb3l8CCTg-1
Received: by mail-qt1-f200.google.com with SMTP id p22so5503847qtp.9
 for <nouveau@lists.freedesktop.org>; Thu, 27 Aug 2020 11:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GIOyNKn4lpZbuj6L4tBDqNoHcELuwP+YTy/cWEhcVsA=;
 b=FdeJs0DgHMESgLVcCMBcJvoEiG87WyNE6MS+NOq3wk6qq1JHSXCHBudh/6zagkt6px
 qqM0Byzmjw0OmE51IdRKZnwn1mR9JkzFj/P8dfCx0mYbLNLnQpxT8PaJSns4nGzp0oND
 E5MFNVYs7a8qWSoikrBfgy9zQQqpLIEXdUN0h7IkrL8ZQ/j/pUQcdAIsQxvTuiFVrvg/
 akyXZcRUpSaIDHEUddtfugOm0BqacOPPKy8y15JiTIr/TUGJH0zo7IwCFeso2wx/0V/K
 z6M5DKrWl6KQqIjTFuekIxCKf04GDKqKRsdT51WY+MyjuIbF3Fa86bw/YIbX0Ly7n4Wk
 fPGQ==
X-Gm-Message-State: AOAM530eJSBFMgaJ3/SKATwlvcHhmdJZ4peLOIoz2lTkMWdlYjxoaVXV
 lnyfxmIy333XXDb/wD7uFWmI8UypbksnAkfeOOPfZ3zNwXXc0SazljG/X7T+Q5rrM6Dxb2NnImN
 bnQ7bvaYfBwrCH1/9gR0YFsLD4w==
X-Received: by 2002:ac8:45c7:: with SMTP id e7mr20255263qto.187.1598553457859; 
 Thu, 27 Aug 2020 11:37:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXdvN0a05gbC1rP9FvdO3i+S9AkoKl/LGZWrmmNmYELI9HeqKh23RzqUkEBrEfpUvhGucamw==
X-Received: by 2002:ac8:45c7:: with SMTP id e7mr20255172qto.187.1598553456580; 
 Thu, 27 Aug 2020 11:37:36 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x28sm2362305qki.55.2020.08.27.11.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 11:37:35 -0700 (PDT)
From: trix@redhat.com
To: bskeggs@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Date: Thu, 27 Aug 2020 11:37:23 -0700
Message-Id: <20200827183723.7767-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Fri, 28 Aug 2020 12:04:59 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: remove redundant check
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis flags this problem

hw.c:271:12: warning: The left operand of '>=' is a
  garbage value
    if (pv.M1 >= pll_lim.vco1.min_m ...
        ~~~~~ ^

This is mostly not a problem because an early check in
nouveau_hw_fix_bad_vpll()

    	if (nvbios_pll_parse(bios, pll, &pll_lim))
		return;
	nouveau_hw_get_pllvals(dev, pll, &pv);

shadows a similar check in nouveau_hw_get_pllvals()

	ret = nvbios_pll_parse(bios, plltype, &pll_lim);
	if (ret || !(reg1 = pll_lim.reg))
		return -ENOENT;

Since the first check is redundant, remove it and
check the status of nouveau_hw_get_pllvals().

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/hw.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
index b674d68ef28a..b96c5628c33b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
@@ -259,14 +259,12 @@ nouveau_hw_fix_bad_vpll(struct drm_device *dev, int head)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvif_device *device = &drm->client.device;
 	struct nvkm_clk *clk = nvxx_clk(device);
-	struct nvkm_bios *bios = nvxx_bios(device);
 	struct nvbios_pll pll_lim;
 	struct nvkm_pll_vals pv;
 	enum nvbios_pll_type pll = head ? PLL_VPLL1 : PLL_VPLL0;
 
-	if (nvbios_pll_parse(bios, pll, &pll_lim))
+	if (nouveau_hw_get_pllvals(dev, pll, &pv))
 		return;
-	nouveau_hw_get_pllvals(dev, pll, &pv);
 
 	if (pv.M1 >= pll_lim.vco1.min_m && pv.M1 <= pll_lim.vco1.max_m &&
 	    pv.N1 >= pll_lim.vco1.min_n && pv.N1 <= pll_lim.vco1.max_n &&
-- 
2.18.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB530D38911
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 23:03:50 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5470410E1FD;
	Fri, 16 Jan 2026 22:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="0mt1bQ8c";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 009D244C96;
	Fri, 16 Jan 2026 21:55:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768600511;
 b=yIuWpjpsq+33XvjP41LTLwj7wkGRyB0uedySQcvzqLG9AUf7T+W5HWHE0Pnripv1Y2xZD
 RRF/QO8zdGcEh/e0iVXtxCA9VhpParAw91PSZEMuDms+JkxQE1cUUZ5T/5/UfuBohQaSj5+
 sPCL0l+oiFyL1ks7Hov1dcrwlxvPHj4SYs8zER8BLN6/ZgaU/kxTHkRhsRS6Mp17en1M1BZ
 +UPy1KfndtKfWay/j+XN1Enxcg8HGP+fBhv1lvudvi1DSeQBs295uzbjvrOGoQD1mitJdGb
 ro+HI+JNBOGLg6owpM3cqAmtCXGvRhShZGktsBNlI4tThlBpvOYFcWIc1SpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768600511; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5M0Ng+pZptYcw9h8uct7tGui2w4pAnLMVXabDgI43YA=;
 b=R8djP6PMrCNwo46ZlyI48KoI1VrAGbquC9ye/4iSwbWASWlquoVFE9KYdRajt80IfAc52
 cHBF7EAGe7zRF6tMzThons2icCuCDYPFF0No1i0ofUivMBrn2nPjK8VEJggUMpUcLkNzFCO
 7+G2a56R9owjljz9POSePfFEVMe5nhOErH3eW/G7iZSs3uUeAGyXEnqt1eDUy3647RTu7BL
 gCaAZlwpU2xtcWtDx8r9tzN2CPLwmHNduF0uqVMwHJJ4UUNBX/K+qEppJTEYNsC/VIhNTyy
 E1IRfrAe5a2w3F4y0gBJh86rhxvKk8YoKer1Ru1k2vfzGnEPLacDKwV1yKOw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1175840744
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 21:55:09 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C9D2510E0FB
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 22:03:44 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-8c6ac42b91eso100120185a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 16 Jan 2026 14:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1768601023;
 x=1769205823; darn=lists.freedesktop.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5M0Ng+pZptYcw9h8uct7tGui2w4pAnLMVXabDgI43YA=;
        b=0mt1bQ8c7zpugQDUYnf+lhcS4wp9bP+gHaRIinIwG/S8FWFkiOk3YjYOmUVeDD16cp
         UtrGJn4RTFEZBBXn7uxnNj9MuVgniBEIB+TyeZypn0L2nTxgVzc1RCFb4gAI7wRwsMIg
         MvBjOZRuo6gzyByn1HF1EUPuoDghasseAGv4FfUxmoCCCyQhxAZKxGL2yANJYaiERqDA
         XcuASNnlRyq26fKh2EWhLfvW3ZNkeeQsDJ8EFG44lsd3o28wvSjhBCq5M4tJ6E+9iEf0
         kP8ElTREt5pmVPV/ir/RqPFtkxcopm/qpGj9K8yMYxA9TEKWfTCaP96PVy1W1MN5UbMe
         fH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768601023; x=1769205823;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5M0Ng+pZptYcw9h8uct7tGui2w4pAnLMVXabDgI43YA=;
        b=MMmx/YPH5e25Gv5xEtFuCjeX4Mn7yJTLEeKaNC3dj0frFXFZiuLws5vHzEjfrfFM6I
         OiXMhk4UlFKGQNE5YWDBESGiWGBc6lvrDvlyZGwl6MugABcAAuaGwy9xPGhN9swq5iCG
         Gevx4MHOQO5LwX+IqrQkGPK9oMVDnmBqtk6tcKRsUDCIHGkMjFJQ21afWpGmwZEGXkql
         ZsMPxZyMhemVcw8uAKKlQh++5VB8q9iVk4V2Ga3/uATCliIU3cUmi0dNFBiDyCAGpR6D
         G17f10v5AxIDCL9j3zeg1U9s8rbQjRgcqCUj7keSAZ9T8z8lk4K9g6KuwqdO9dyBUlhZ
         Z5rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGhaMwEwpdbk+PQRkwSiQc8OVElOx2wA040iDk1voNGmY4Haj6hAc7XDCvfj5D5B6nv0dcesjJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxReeHmlqHwnNtfmyOrB10EoDQtMIM550HOF6gwjZUY4gVEKPo6
	m7/1t8wOLyDXcbvNhJyoD2p13K1CiTa2MXV8pZLmjWWX7cvoSxC3G5CobqfZTsZVqXs=
X-Gm-Gg: AY/fxX5DyTy7rroBoGPoiLafo5PkAdDo+SMuaXKCJn9qz4DSnXjOzeg3KpQ+zN8Fjik
	AcbWQ2pNMOylnpvFYKQT+nbf7+fa5ZhTowtA3053JjcoXeC/vO4zQnR/RcZszjeqprhsCI+FO0Q
	/wboXeo3ZqEcLgOcHVu+ihOf10kXz4ORF3JP0UfY/xSw1JAalYKOoiIQkO0FhUrzaLtxybCFqCI
	fe8ULUBp/7WR5NW46oFPqfsIaLlUNaXpAoJ9Hd+ku2bIHIw9XrCL/83zUTWaQJ6Fj3A89mY2HKs
	NE68GsKZZG7qdtkaw/1Fetwsi9mjBKckoyJhnN7tfEw/9B1VuMeiCZRIgxflQTg31ulQJyuvnkQ
	eSDTQaD+5h7KU+WvUk/7PXQhMqQVX2bilqk1y32NvexIUZ1xC1swVwMFP0iRIuXW07gP1BmpJf9
	OGsDGuLy6A8FjLg1Yx95BgaUE9kZmHJyyMYtIqixbO4y0zj9LNvtI7D2S01SXlMrOGKd/5etJsq
	WFeBg==
X-Received: by 2002:a05:620a:4609:b0:8b2:db27:4268 with SMTP id
 af79cd13be357-8c6a6768552mr556329085a.53.1768601023402;
        Fri, 16 Jan 2026 14:03:43 -0800 (PST)
Received: from [162.83.196.141] (pool-162-83-196-141.nycmny.fios.verizon.net.
 [162.83.196.141])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab20dsm320798585a.5.2026.01.16.14.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 14:03:43 -0800 (PST)
From: Mel Henning <mhenning@darkrefraction.com>
Date: Fri, 16 Jan 2026 17:03:27 -0500
Subject: [PATCH] nouveau: Stop advertising large page support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-disable_large_page-v1-1-fdbf85603353@darkrefraction.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAzAvjJ6VrBzevArIlJdnQXRsYEIsr9bP
 AaSvJA5CWcYzAuJb8lynQpYGVh3OgPX4pXBNrZvEPvaS6bl4PmgFHiOpIYjQtda5zryoGFMvMn
 zT8eplA/KLGQyZAAAAA==
X-Change-ID: 20260116-disable_large_page-4aa1432445ad
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Mary Guillemard <mary@mary.zone>, James Jones <jajones@nvidia.com>
X-Mailer: b4 0.14.3
Message-ID-Hash: KNXR42WUW7FVG6GBTV233EVQL55SK3A6
X-Message-ID-Hash: KNXR42WUW7FVG6GBTV233EVQL55SK3A6
X-MailFrom: mhenning@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KNXR42WUW7FVG6GBTV233EVQL55SK3A6/>
Archived-At: 
 <https://lore.freedesktop.org/20260116-disable_large_page-v1-1-fdbf85603353@darkrefraction.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Since large pages landed, we've discovered a hard-to-debug issue related
to 64 kB pages. Disable it for now.

Fixes: 85ce566b3624 ("drm/nouveau/drm: Bump the driver version to 1.4.1 to report new features")
Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 0e409414f44d..5b931260ce40 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,7 +10,7 @@
 
 #define DRIVER_MAJOR		1
 #define DRIVER_MINOR		4
-#define DRIVER_PATCHLEVEL	1
+#define DRIVER_PATCHLEVEL	0
 
 /*
  * 1.1.1:
@@ -37,6 +37,8 @@
  *      - implemented limited ABI16/NVIF interop
  * 1.4.1:
  *      - add variable page sizes and compression for Turing+
+ *        Note: Rolled back due to issues with large page support
+ *        see https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610
  */
 
 #include <linux/notifier.h>

---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260116-disable_large_page-4aa1432445ad

Best regards,
-- 
Mel Henning <mhenning@darkrefraction.com>


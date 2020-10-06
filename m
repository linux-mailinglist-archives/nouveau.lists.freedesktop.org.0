Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D028544F
	for <lists+nouveau@lfdr.de>; Wed,  7 Oct 2020 00:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D9E6E5AB;
	Tue,  6 Oct 2020 22:08:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD646E5AB
 for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2020 22:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602022094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QPqbnsxsWaRE219Vn53eaMNzzTB/NPL6AqeZ9gcAMXs=;
 b=NreX3ETz22RcptJ3yCF7lGW0elPFn7x5aUm+/ThFoWdjH+uv3QuznWWN8/GOwxQ3C9wChK
 oW3r+Q9Hw5wEBZDPlEO4qqd0VG8MYZgiaGAwvtvbyV7aUi9jkSh9cT4UKW/BkFPbnptjG9
 G56/9dWUTmJIYTnA7k4saMZajDOg0YE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-BjwaaKlhO2Sc28cRdkTmLw-1; Tue, 06 Oct 2020 18:08:13 -0400
X-MC-Unique: BjwaaKlhO2Sc28cRdkTmLw-1
Received: by mail-wm1-f72.google.com with SMTP id f2so3955wml.6
 for <nouveau@lists.freedesktop.org>; Tue, 06 Oct 2020 15:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPqbnsxsWaRE219Vn53eaMNzzTB/NPL6AqeZ9gcAMXs=;
 b=FwShN0nAsDYxhs2ejNWXYQyzzHcgpwj+aZjQ6/FoYhvcvtI65KZ19xrNhswRAcayeq
 b3VOp/r2ilXpfXoDxrmYYaaEtpb1aV+myxPtFwnrEN2PNYL0iu/YkRIpS5h+9fr9JuLw
 +J+MKegJJEcsPUjjpXr+Pv7Y8kBGTl8gNelx2dL4u6BpWpE0vhcS7KtaKk85TlY0Cmcq
 PEw5GivSXo3R5zqb3lpMFp3FJDMg29mSsrQyXyRg6y5qzZV1TD/20ErRSWpuGcTmEH9A
 RbQFTFrHhDwvAi4m/UVFF0gC92pd16EAUBySp+tL7QnDxt5bpohSJGE7MQXIef7lfHEp
 AgmA==
X-Gm-Message-State: AOAM530NoODdBicnVsxn97K6EThkWKJLOzZXZre+Gkl3hwGrUv+lEB81
 2QkyByWVES1Li45vJ71Mr4hRWB3PEgtTsKsHC8q1t62x/BHe+qNVT9Kx09Ipdk6nvQe5H1vGBey
 YEW/i+D9OZwwHOYnqH4AvuCpZAg==
X-Received: by 2002:a1c:cc0a:: with SMTP id h10mr59214wmb.80.1602022091986;
 Tue, 06 Oct 2020 15:08:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWJ7DKR1Me+G9KmGQi1p82XE88PYbyZVujF+d6G/O0MnHEh4H35/ToM5Yd+bENVSgT6zQO5g==
X-Received: by 2002:a1c:cc0a:: with SMTP id h10mr59208wmb.80.1602022091833;
 Tue, 06 Oct 2020 15:08:11 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b088:c000:2bdf:b7aa:eede:d65f])
 by smtp.gmail.com with ESMTPSA id j134sm128192wmj.7.2020.10.06.15.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 15:08:11 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed,  7 Oct 2020 00:08:09 +0200
Message-Id: <20201006220809.14240-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [RFC] gem: fix "refcount_t: underflow; use-after-free"
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

we can't use nouveau_bo_ref here as no ttm object was allocated and
nouveau_bo_ref mainly deals with that. Simply deallocate the object.

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drm/nouveau/nouveau_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drm/nouveau/nouveau_gem.c b/drm/nouveau/nouveau_gem.c
index e11303fbc..45582a8dc 100644
--- a/drm/nouveau/nouveau_gem.c
+++ b/drm/nouveau/nouveau_gem.c
@@ -198,7 +198,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
 	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
 	if (ret) {
-		nouveau_bo_ref(NULL, &nvbo);
+		drm_gem_object_release(&nvbo->bo.base);
+		kfree(nvbo);
 		return ret;
 	}
 
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DDA2A5070
	for <lists+nouveau@lfdr.de>; Tue,  3 Nov 2020 20:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EEC16EC22;
	Tue,  3 Nov 2020 19:49:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CFF6E8F3
 for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2020 19:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604432982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRgALKeAwL3sx0iS2wQ17fqCri52qNRN6hAIi0XVJ6g=;
 b=SRHQN6MD/QnwQc5N76RkpZlx34hsLp4t+q7jCtkfp6iaSuynVhLEpBVZJ+LrM+9UHn9bXC
 H+eMTluNJ/I9fr2GZRejSghbELvkf3SEGbV258vT/8Ibxq1KxsVF1QNxZyTtqEVFWvANVb
 X8LqeaxwbOsdIPvRue4ojt69t7+R5cA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-XpjCkLpoP5WbRE1B2fyodg-1; Tue, 03 Nov 2020 14:49:39 -0500
X-MC-Unique: XpjCkLpoP5WbRE1B2fyodg-1
Received: by mail-qk1-f197.google.com with SMTP id n23so10463743qkn.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Nov 2020 11:49:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yRgALKeAwL3sx0iS2wQ17fqCri52qNRN6hAIi0XVJ6g=;
 b=ePuTELFBijp13P6ni01J58qW4tclMfztWS6WvhvAr7y5QcFv/tbV1HbTqZxYFtmjMH
 N5hlZBs7zhzpccb2SJh8M0INyO7wqZ7F1i0mh1gyR9Bc3wwf8+Nyh+HAZH0+YlIMy4Nl
 7kg8Mt7A8sDmVkVwAZpEP0s6Mig/yZ7ps8NN3psF+xcJLj9dyRj7pOAnduYox/UWJIQv
 mDAWGy/ob01qh4C1M9Cws3y3hkr/5qQ7Pa0C9sXyuTY9m8nTlA/evn5rMq503iN5BJ+A
 pxcB8FA+wM+uUBsi3cdKbsuKW2sQg/OSPy3W4shrifIv38ZRuXYw3ZaKAQz0uSJ0CGYM
 /CgQ==
X-Gm-Message-State: AOAM530cpCtPhUOguY4mKEUyFaN9urezc474n2ZQX2qhQ2b31AOJRVAS
 Ia/OMDKKymc3EW5S0oIAQK6Iv9ZNhQ2ge++k/IrHOLonGfdDR6tCbWX2vS/vo7h0vcJ7GP+m8tF
 6fOBEQsH9kbRoialTsH5zXNJR4g==
X-Received: by 2002:a0c:8143:: with SMTP id 61mr28273244qvc.6.1604432979409;
 Tue, 03 Nov 2020 11:49:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxe2/eHvm2y4cYBO5/HR+vq0YC4gRRvwFqseWsvRM6ddEbcIT1VL9RyJKhYkXTPnfzfIHbvuA==
X-Received: by 2002:a0c:8143:: with SMTP id 61mr28273226qvc.6.1604432979204;
 Tue, 03 Nov 2020 11:49:39 -0800 (PST)
Received: from xps13.redhat.com ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id w25sm11392532qkj.85.2020.11.03.11.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 11:49:38 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Tue,  3 Nov 2020 14:49:10 -0500
Message-Id: <20201103194912.184413-2-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103194912.184413-1-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 1/3] drm/nouveau: use drm_dev_unplug() during
 device removal
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Nouveau does not currently support hot-unplugging, but it still makes
sense to switch from drm_dev_unregister() to drm_dev_unplug().
drm_dev_unplug() calls drm_dev_unregister() after marking the device as
unplugged, but only after any device critical sections are finished.

Since nouveau isn't using drm_dev_enter() and drm_dev_exit(), there are
no critical sections so this is nearly functionally equivalent. However,
the DRM layer does check to see if the device is unplugged, and if it is
returns appropriate error codes.

In the future nouveau can add critical sections in order to truly
support hot-unplugging.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index d141a5f004af..4fe4d664c5f2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -792,7 +792,7 @@ nouveau_drm_device_remove(struct drm_device *dev)
 	struct nvkm_client *client;
 	struct nvkm_device *device;
 
-	drm_dev_unregister(dev);
+	drm_dev_unplug(dev);
 
 	dev->irq_enabled = false;
 	client = nvxx_client(&drm->client.base);
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

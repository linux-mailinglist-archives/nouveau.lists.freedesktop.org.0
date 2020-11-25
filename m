Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52192C48FD
	for <lists+nouveau@lfdr.de>; Wed, 25 Nov 2020 21:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835596E912;
	Wed, 25 Nov 2020 20:27:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9596E912
 for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2020 20:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606336036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyv7TmTJOo07L0V0MDDH9iBw1ZsQzWrWnebIO9wiR7I=;
 b=VzNyn4zXiVsJXh4o/4vmzlKVLwaLEMfUa/df8AMs32pAU9Yun64EckuClP0k341B01YSXP
 AYwOqCqXjksGM1sV4Pi0++g/LCXfM3gQlrNaNcCWGrkxoVr7D8XTaWJufaMw32/E30PlUQ
 0I9KamDzXt55rRi2ub/p2lI2LxIqcBE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-oVOZHo7wPb2WYgTYW2xtDQ-1; Wed, 25 Nov 2020 15:27:12 -0500
X-MC-Unique: oVOZHo7wPb2WYgTYW2xtDQ-1
Received: by mail-qt1-f199.google.com with SMTP id r16so3231790qtn.19
 for <nouveau@lists.freedesktop.org>; Wed, 25 Nov 2020 12:27:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oyv7TmTJOo07L0V0MDDH9iBw1ZsQzWrWnebIO9wiR7I=;
 b=iFMYm9FwrtEBUc6QBab7mPPLbbaLNJw1zQm9Ov8l0u83DluMJsl8Egseo2TOuv8B03
 I4GWDLO+6J2kC2DYOkO4YdDpcY8FxEdBwPLrjvPtMXAZOdbxRDk6KNHZFiAMQnvIQtV+
 ISbPY0dNjK3hhVCz9A4hIVwUXvPETOHtHF604kKYdYmaH844k4z9ayee/hIbQzBHxQy6
 qofp6xhoxpHUQiiAxN2XUazO2NVLm2zoMKuDpFS6SG8eZjqJVQOWNWkf/L3dOKtglA/n
 rgW2iv1Wh95+5Pdbsk6Q7vYac8kntlRqlZ46qvxV+yRyELEUpsFuJtsg/meze3qb1i+c
 9SQQ==
X-Gm-Message-State: AOAM5311DCGd87iYcEIU6iRxpAbUOAc9QyqctIXqlxN8dsMo6jJsAk7x
 MLu65ltCcfaSOJ05qM7RiSrg2qHGIZSbvTPy1Gk7IAYfq1VmLEkONbOxp+XcCXpxUPPGnC+iWME
 C8NhJB0XujZejLGa+YObIIZsLog==
X-Received: by 2002:aed:39c2:: with SMTP id m60mr663847qte.206.1606336031656; 
 Wed, 25 Nov 2020 12:27:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKH4xIOuYE9iphSs67b2xooUR1MwfVJh1L82U2A+W+f2xs7dI2EaoZEqdNs7n2LbREsN/4Fg==
X-Received: by 2002:aed:39c2:: with SMTP id m60mr663825qte.206.1606336031489; 
 Wed, 25 Nov 2020 12:27:11 -0800 (PST)
Received: from dev.jcline.org ([2605:a601:a638:b301:9966:d978:493:6a3d])
 by smtp.gmail.com with ESMTPSA id o187sm431772qkb.120.2020.11.25.12.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 12:27:10 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 25 Nov 2020 15:26:46 -0500
Message-Id: <20201125202648.5220-2-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125202648.5220-1-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
 <20201125202648.5220-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH v2 1/3] drm/nouveau: use drm_dev_unplug() during
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
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

Cc: stable@vger.kernel.org
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

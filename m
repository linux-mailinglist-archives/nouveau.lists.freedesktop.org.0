Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3352A506C
	for <lists+nouveau@lfdr.de>; Tue,  3 Nov 2020 20:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DF96E8D1;
	Tue,  3 Nov 2020 19:49:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C56F6E8D1
 for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2020 19:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604432975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RMhmlI7J39tGZ2SV4Ku6FWb6g9FR/7RgJqLGVWssnYI=;
 b=XrwDBhT8+fgWVLj0AUacQyEBAyT/J5rAs1WqmU0Jpp+qzgrCgXg+Y7FtrlJeGWDZb2eO+h
 iKFlkp4KavZCTWrgVc68Y8Cv07OG0TjCqTo1IIcRpgWAq1fCaacF63vy8qt8b730i1nto2
 TkM2onhnX1VYZGzDcnpWZrqPvEzIHMY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-zZ5HCH6uM6mdkO7ZfWm9wA-1; Tue, 03 Nov 2020 14:49:33 -0500
X-MC-Unique: zZ5HCH6uM6mdkO7ZfWm9wA-1
Received: by mail-qv1-f69.google.com with SMTP id x10so6297137qvo.22
 for <nouveau@lists.freedesktop.org>; Tue, 03 Nov 2020 11:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RMhmlI7J39tGZ2SV4Ku6FWb6g9FR/7RgJqLGVWssnYI=;
 b=NRgtYLkS49UBFaQOTWPn85mPJS069AqHP33x9oayc4B7bZpDk+srMdVE6+xbmUUCee
 8BVB22CIkhLwztMun8asx1c/P++LgF7yDtiotZJWd0g6pNSC0ZlZQfieLIK08WbxbPFL
 IpOznM5XT1S1SHFXJ3BCqV2YcVyRRKtStBItz6zNjAatk7y/g9dpCmpWCS3MDq+hbhqC
 EbO7CnLpPkx+++yEOVrjJX6I3Z8zeb7KzSo5X1ATVhft9Vv/AVpU/970dzS8ln7FmTrC
 L4itNPJfTPUmHNBRMVY36jC/8T22uqoZ7n1WSsCCFanz39m7Osw/27hqmSJrRkg5nTIX
 s8cg==
X-Gm-Message-State: AOAM530y6lkZHa4we4s9BWHqBmGV8HTms7mluDS53kRMHFxR/vX/Misb
 6x/XbJFiGl7QEyqNCl5zmb5/mQDNN7HDMCiIANkwQoLflRsTSpgfznfPAapWEoRR7y3fUZWwjtE
 rFSQXIHrKoQYcUHzutHEROeA9Cg==
X-Received: by 2002:a37:c441:: with SMTP id h1mr21747183qkm.298.1604432973168; 
 Tue, 03 Nov 2020 11:49:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy41D81xBVSWbgfUtCJ62NG9CG/yhsi1aEcls1TS+xTGUJGjh7vp2/8LAkziyOyD18UEa3N7Q==
X-Received: by 2002:a37:c441:: with SMTP id h1mr21747159qkm.298.1604432972928; 
 Tue, 03 Nov 2020 11:49:32 -0800 (PST)
Received: from xps13.redhat.com ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id w25sm11392532qkj.85.2020.11.03.11.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 11:49:31 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Tue,  3 Nov 2020 14:49:09 -0500
Message-Id: <20201103194912.184413-1-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 0/3] drm/nouveau: fix a use-after-free in
 postclose()
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

This series fixes a number of use-after-frees in nouveau's postclose()
handler. It was discovered by pointing IGT's core_hotunplug tests at a
nouveau device, but the steps to reproduce it are simple:

1. Open the device file
2. Unbind the driver or remove the device
3. Close the file opened in step 1.

During the device removal, the nouveau_drm structure is de-allocated,
but is dereferenced in the postclose() handler.

One obvious solution is to ensure all the operations in the postclose()
handler are valid by extending the lifetime of the nouveau_drm
structure. This is possible with the new devm_drm_dev_alloc() interface,
but the change is somewhat invasive so I thought it best to submit that
work separately.

Instead, we make use of the drm_dev_unplug() API, clean up all clients
in the device removal call, and check to make sure the device has not
been unplugged in the postclose() handler. While this does not enable
hot-unplug support for nouveau, it's enough to avoid crashing the kernel
and leads to all the core_hotunplug tests to pass.

Jeremy Cline (3):
  drm/nouveau: use drm_dev_unplug() during device removal
  drm/nouveau: Add a dedicated mutex for the clients list
  drm/nouveau: clean up all clients on device removal

 drivers/gpu/drm/nouveau/nouveau_drm.c | 39 +++++++++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_drv.h |  5 ++++
 2 files changed, 39 insertions(+), 5 deletions(-)

-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

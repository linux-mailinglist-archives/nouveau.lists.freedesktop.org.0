Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B419674CE39
	for <lists+nouveau@lfdr.de>; Mon, 10 Jul 2023 09:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5719110E1EA;
	Mon, 10 Jul 2023 07:23:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C46710E1AB
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 06:37:05 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4QzvRx51rzzBHXhB
 for <nouveau@lists.freedesktop.org>; Mon, 10 Jul 2023 14:37:01 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688971021; x=1691563022; bh=lCQQ6bZ2yko3g+i53phatiilgdz
 4TTN3JzNAMdsBb/c=; b=MXZcKlhWuxsqkJ3IP5TCBw7LTwnZiDyxzn5OrkT2+5Y
 M0TFW9QiHDvr6ZORHqmBye64aNQhHGBaS9BuyTjaSddbtfMl61jqSe6ovzbygsT1
 Dsvf2N9gzFyaS779kC3KyI4oTOoAQTdopYZ8xkPJYe88VU9eRtRxONN+DFpmNLji
 AYWFSQlBCu8jaL1mNlo7eqoiRa5MP81t74uyBLv0Y9OloI6OV3kNbOFtOB+SNyWq
 uTWSNoVQEfA8r7G2mfhttC22lnKeHGtKeW4WnYh5TNuP/eG6YNi2udqG4knnLQvp
 c3SCnCJpqHD63UMF3NOIPyMCzzLMflSY88NGzSfxvVg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UKU_zZn57Gte for <nouveau@lists.freedesktop.org>;
 Mon, 10 Jul 2023 14:37:01 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4QzvRx2nWnzBHXgl;
 Mon, 10 Jul 2023 14:37:01 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 14:37:01 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
In-Reply-To: <20230710063529.53769-1-xujianghui@cdjrlc.com>
References: <20230710063529.53769-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <2156ff3c1fcec8914f1493ac6d7cd807@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:23:34 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/i2c: do not use assignment in if
 condition
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
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Assignments in if condition are less readable and error-prone.  Fixes
also checkpatch warning:

ERROR: do not use assignment in if condition

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c 
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
index 96bbdda0f439..a1cf406ff141 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
@@ -85,7 +85,8 @@ gf119_i2c_bus_new(struct nvkm_i2c_pad *pad, int id, u8 
drive,
  {
      struct gf119_i2c_bus *bus;

-    if (!(bus = kzalloc(sizeof(*bus), GFP_KERNEL)))
+    bus = kzalloc(sizeof(*bus), GFP_KERNEL);
+    if (!bus)
          return -ENOMEM;
      *pbus = &bus->base;

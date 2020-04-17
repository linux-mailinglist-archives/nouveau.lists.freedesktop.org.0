Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC651AE44C
	for <lists+nouveau@lfdr.de>; Fri, 17 Apr 2020 20:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA126E40D;
	Fri, 17 Apr 2020 18:10:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351746E40D
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 18:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587147038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=80JMWiuUHSlwZu6hLj9egtbR/kZ0gHnUjmy4lUY2Aj4=;
 b=SpcpKyH7RwNppWTxB+LDINcPGlS49T7HmHYyTJBR7kYl//FzwMR9AAr1N26JNsfu2WGVjG
 S26URw3UwotISaSiSBs7I4XkqfaqnhfogzMpVWBdC3DNr314zu2xHavs+UESixMpQq019D
 pfZe46VYKrik++aQlB6Bf/w3T3+uTZ4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-sur6M8fUPCamytxk89KDTg-1; Fri, 17 Apr 2020 14:10:36 -0400
X-MC-Unique: sur6M8fUPCamytxk89KDTg-1
Received: by mail-wr1-f69.google.com with SMTP id a3so1431813wro.1
 for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2020 11:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2+3lkjWo6Yi+Sso3X2t7JBnbz4vvnf/0wtUX21SbkM=;
 b=il6ca57ljjY7dTqPp1pt2+og+Os1XveTJCIpZBwMe/T8edbIkJOhZZs9Zjf5gLdvAO
 teHGul9YcvxG7D4uhwld0CQeazy+LRukv2FiWl3TDYPLwMFIpOuk/ReyMV832TZR1skA
 QGTu3GATVzF9WkLAa5Q9pjzVDT+83UxSdAIA3XNojJlIEmVf1d7IyYPUs9Oa17HVikAW
 d8N5HNrV+4eHq4SMgYolk4r2tO8O2ll2EIIK/m8mytAxSkvld8OSNSDMiAQWijtO07R9
 q/bqitNmgOzV+dC9Fzr3vp9DOUBCSrgzpXuV1bMLAdEVYKWTKjcMjrKXfOWpzqv7d6m+
 6d7g==
X-Gm-Message-State: AGi0PuZHdop5aZ1LKqsEP6gHqwqWv1Z9rxPlgw4GRhqTR3FJ7keusfYk
 6eG9/TLJBF4uI6HD5n6aGZESdLn6hwtWw3sntbJi2iRF6jtYTWGoGNLWIqcdGJR1BNULwzMRjzb
 Cjc0pOUmNFgKoo6EycmQi4GdMzw==
X-Received: by 2002:a1c:5a06:: with SMTP id o6mr4554414wmb.34.1587147035001;
 Fri, 17 Apr 2020 11:10:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypKNhegsJb5AiJFdz6+qKoN0bimsNXWyt3I2gUrOPbD/CU+8ScTIEDS/+rlWreZoDfXgwXY3lQ==
X-Received: by 2002:a1c:5a06:: with SMTP id o6mr4554391wmb.34.1587147034691;
 Fri, 17 Apr 2020 11:10:34 -0700 (PDT)
Received: from kherbst.pingu.com ([2a02:8308:b0be:6900:482c:9537:40:83ba])
 by smtp.gmail.com with ESMTPSA id e5sm33878381wru.92.2020.04.17.11.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 11:10:33 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Fri, 17 Apr 2020 20:09:30 +0200
Message-Id: <20200417180932.111335-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH v2 1/3] device: use the correct mmio size when
 mapping
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

Fixes warnings on GPUs with smaller a smaller mmio region like vGPUs.

Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drm/nouveau/nvkm/engine/device/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
index 8ebbe1656..17676c75a 100644
--- a/drm/nouveau/nvkm/engine/device/base.c
+++ b/drm/nouveau/nvkm/engine/device/base.c
@@ -2963,7 +2963,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 
 	/* identify the chipset, and determine classes of subdev/engines */
 	if (detect) {
-		map = ioremap(mmio_base, 0x102000);
+		map = ioremap(mmio_base, mmio_size);
 		if (ret = -ENOMEM, map == NULL)
 			goto done;
 
-- 
2.25.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

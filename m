Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01131509638
	for <lists+nouveau@lfdr.de>; Thu, 21 Apr 2022 07:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E9C10F334;
	Thu, 21 Apr 2022 05:07:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBD610EBE6
 for <nouveau@lists.freedesktop.org>; Mon, 18 Apr 2022 14:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650291533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rU+BOzU7OFMdCRKMQTeeqDo4Ukzfu12ch4PVunTJ6T0=;
 b=IWIxtE8Yh8nNA/YNswKDgmdkPlJO+B7q1y63TdJWP4IIGT7l6HyXS3SvuRSHXcR3wYfBMD
 0XNBi2kOJ598tCBzC8lOSaLNuskU0UU7sIFgLGV6PQ5JUiZaA3WH4ttaNCVWFFvf27XoZ9
 OCbaAnLE4QvY0v5YHjH8nN+fe3WtDPA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-WmAJA0R7MuaASupfoIlxWw-1; Mon, 18 Apr 2022 10:18:49 -0400
X-MC-Unique: WmAJA0R7MuaASupfoIlxWw-1
Received: by mail-qk1-f197.google.com with SMTP id
 m23-20020a05620a221700b006809e1fa4fdso10440490qkh.6
 for <nouveau@lists.freedesktop.org>; Mon, 18 Apr 2022 07:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rU+BOzU7OFMdCRKMQTeeqDo4Ukzfu12ch4PVunTJ6T0=;
 b=3cuB+KgO+2Jby8XmVlf3APkT9hKgnMTlwP1yz/iboe38UgX+8dx9JXpInTPh+3yEi1
 71LMsA3uXfiIRzp3/ScxMX4RKTWDtr8vXTm2kQpyVchYSEUvN91Ydw9OgpkbyNcExDJr
 DnlA7oe+FzWHqMnLiwhqbsXR6KxBqYDYIEE7WNc2mHvgvBN4KsU9R1IPsetk5/c2BmD1
 1os7eN/kUkgLvfqRKLafwsQQJLXOfVzAew8kp7DM69zh0HCe/IJdKLFa1Xhm96AFdbxQ
 DaJDNuw5x5ghlxKGRj9PiWXa8j9frdYcbb2B/I+Qw2sR4u0xJkCNwI8BkMEHqby10kym
 Mlxw==
X-Gm-Message-State: AOAM530zCNh1dyfxFWaULH48Twpll2SxyVPJID/DEOVp5PM7+O2WHQuD
 ljRThr3h9xTE3glXmBbS9/DKF4hJxveZGqmjldbPO9nb26XHop2PVnuFNK5yp6YPd0+FS1UTDml
 pTVsfev4Q6WBi7d1izzW6tDfJSQ==
X-Received: by 2002:ac8:7f06:0:b0:2f1:f823:856a with SMTP id
 f6-20020ac87f06000000b002f1f823856amr5665530qtk.623.1650291528869; 
 Mon, 18 Apr 2022 07:18:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/SQVkTBbtpx6NFVq6KE6yRW7/GHXsA0oi2d+LEGg7hhPI3vQ5/gmQ8L/2ysPbdvyDIKURNQ==
X-Received: by 2002:ac8:7f06:0:b0:2f1:f823:856a with SMTP id
 f6-20020ac87f06000000b002f1f823856amr5665514qtk.623.1650291528603; 
 Mon, 18 Apr 2022 07:18:48 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac85ac2000000b002e1cc2d363asm7785952qtd.24.2022.04.18.07.18.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 07:18:48 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch
Date: Mon, 18 Apr 2022 10:18:42 -0400
Message-Id: <20220418141842.296386-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Thu, 21 Apr 2022 05:07:14 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: change base917c_format from global
 to static
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Smatch reports this issue
base917c.c:26:1: warning: symbol 'base917c_format'
  was not declared. Should it be static?

base917c_format is only used in base917.c.  Single
file variables should not be global so change
base917c_format's storage-class specifier to static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/base917c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base917c.c b/drivers/gpu/drm/nouveau/dispnv50/base917c.c
index a1baed4fe0e9..ca260509a4f1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base917c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base917c.c
@@ -22,7 +22,7 @@
 #include "base.h"
 #include "atom.h"
 
-const u32
+static const u32
 base917c_format[] = {
 	DRM_FORMAT_C8,
 	DRM_FORMAT_XRGB8888,
-- 
2.27.0


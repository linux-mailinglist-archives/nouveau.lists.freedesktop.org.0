Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B777A2CF4
	for <lists+nouveau@lfdr.de>; Sat, 16 Sep 2023 03:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7F710E099;
	Sat, 16 Sep 2023 01:15:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACEA10E6C4
 for <nouveau@lists.freedesktop.org>; Sat, 16 Sep 2023 01:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694826925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WTvJns8PYkGFFmakegCzthUJw5bg+bFo9pou/fXqqxk=;
 b=SYJUZWkaSnAz+1AewhB07VM8LzcorusIhQnsel7CfRUAiq6FT0z3ufvSi4kEvShfjnaQtM
 +VjD5tcUbJG2UxnJ8UZYuKvnuNYctuAlPWtdUP3J5PWRog/+6awbx5FpW8QSj+3kwfJMp3
 d+ihoSOn1HZ9Zchkv/raDW+wyDcycQs=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-wS-QXUdONdGTsLsdXrv7DQ-1; Fri, 15 Sep 2023 21:15:24 -0400
X-MC-Unique: wS-QXUdONdGTsLsdXrv7DQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-502d7ccdda3so3240103e87.3
 for <nouveau@lists.freedesktop.org>; Fri, 15 Sep 2023 18:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694826923; x=1695431723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WTvJns8PYkGFFmakegCzthUJw5bg+bFo9pou/fXqqxk=;
 b=ZgY9TeQf+u9CVSGKHbTbNSFtbGdRIx/+0bWxcL1XyQA4DWC/ZRN9IonvO4x9gHgTDs
 2YGZlDP7TmJntv1PG3bMaMv3dVprFVabkJs7ARWxKtJYLQkaWi61DD8FkSp5z9TtnthJ
 qNUTY7bPiUVOLIY8mhk4q6n6CScG6rxKClAwr/E8ovOcEjTo67JPb9BBubk/2NdD/791
 LoAWk6XUggqyfqElWB8KoVR7CeWgoX7aNgdrupwvRkjYxE+zmsa3QSlrVFj+GYbb+reU
 K9tuEHQrdWzE7fWUWyRwWMnGUX0hJXoX7zvfMzQovKJbL4qg0JkCgBI9SchbV6ayVjy/
 3NyA==
X-Gm-Message-State: AOJu0YwtRgVYvGTJOfraIrmvUx8DpQCbrZHPeur4Pysfk08Z9Xi0aFUH
 hH1jDeAcXsLQlIKTNdtihK4TqtDhlcC7SC3aVMAlsQt4txht6PKdCk5/1glSFLdcCz01Z0qKKVN
 pKqXvSNDbpj2L/Hj1EvNzg50yLO2CwbauhsaS4BNt58+FzPJa2T0GEXUEn8NkmtA3+6Qr+I1ehQ
 Fe8HS2
X-Received: by 2002:a05:6512:3096:b0:4fe:95e:159a with SMTP id
 z22-20020a056512309600b004fe095e159amr2908400lfd.23.1694826922858; 
 Fri, 15 Sep 2023 18:15:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz0EMvJd4TNeQ4YjHEYLo6LbSsfrSNyVgn/6D+3ZUxelFgWP/9aJ5mKCk+DEZTvO2FIAJ6pQ==
X-Received: by 2002:a05:6512:3096:b0:4fe:95e:159a with SMTP id
 z22-20020a056512309600b004fe095e159amr2908384lfd.23.1694826922425; 
 Fri, 15 Sep 2023 18:15:22 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 q18-20020aa7da92000000b0052cdc596652sm2874967eds.23.2023.09.15.18.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 18:15:21 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Sat, 16 Sep 2023 03:14:58 +0200
Message-ID: <20230916011501.15813-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau: fence: fix type cast warning in
 nouveau_fence_emit()
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
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fix the following warning.

  drivers/gpu/drm/nouveau/nouveau_fence.c:210:45: sparse: sparse:
  incorrect type in initializer (different address spaces)
  @@     expected struct nouveau_channel *chan
  @@     got struct nouveau_channel [noderef] __rcu *channel

We're just about to emit the fence, there is nothing to protect against
yet, hence it is safe to just cast __rcu away.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309140340.BwKXzaDx-lkp@intel.com/
Fixes: 978474dc8278 ("drm/nouveau: fence: fix undefined fence state after emit")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 61d9e70da9fd..ca762ea55413 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -207,7 +207,7 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 int
 nouveau_fence_emit(struct nouveau_fence *fence)
 {
-	struct nouveau_channel *chan = fence->channel;
+	struct nouveau_channel *chan = unrcu_pointer(fence->channel);
 	struct nouveau_fence_chan *fctx = chan->fence;
 	struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
 	int ret;
-- 
2.41.0


Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B9B7DFE07
	for <lists+nouveau@lfdr.de>; Fri,  3 Nov 2023 03:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC7510E373;
	Fri,  3 Nov 2023 02:41:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BB210E3A7
 for <nouveau@lists.freedesktop.org>; Fri,  3 Nov 2023 02:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698979315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ny2ZFzxeENDJSTZ9wCuQplKwvwWNLKdmgqeowZjx4K4=;
 b=iw4KtmjB2t85+eR0PqQz1eigKJw6zIv4lDgHEaEFhM+gDb8zwBqQokrylLCPfXU2yv59xO
 V4HH3wQefF91vXqxl2zdLW6KdVpbcN7kfQjINLzcFuJuuZWpDRNNdLE4TqAXW3EbQxpFMK
 z1rmvPWhCUU3gDRP0rakt4loam+nENE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-ZjhGHb4MM_urDqQqLl8FaQ-1; Thu, 02 Nov 2023 22:41:54 -0400
X-MC-Unique: ZjhGHb4MM_urDqQqLl8FaQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9cd789f0284so111842766b.3
 for <nouveau@lists.freedesktop.org>; Thu, 02 Nov 2023 19:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698979313; x=1699584113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ny2ZFzxeENDJSTZ9wCuQplKwvwWNLKdmgqeowZjx4K4=;
 b=YRZATH/bjS1V04VIe29FUB9edGeK38DmIUXlJ+LJ5u65ixqkIGf2P2xQPYUO4kZx4i
 oZX/bPXYqDA35TiiQmjE0GU5dOzjJrnViQaNdOTUBMT4cQDWuCLh2PrucvCIZZ+/0pXh
 zINVhBqqrSJa3spMcQbGif715b28r45GtZp9f49Z9kniWDjqPR6pwfANPuQsLrN9hRs0
 75VhqfYLuvt9vNUiRFrjySDq4C6DZYVpzf5ThTaEaFVoQyuy8chW7YgBQC8wHoU4iDtC
 4ZceQjh6E67m1DWPBQ99ieswXFILLd3cMPpVH+CC8EjSMlhJdNrHo1kjxUULnJa++cgg
 sELw==
X-Gm-Message-State: AOJu0YwcYXe60JDXolwWiZCyzcIt6C5JVrwwCtClu/0GmjvoLX4/IkCJ
 v0rEzXbAEVvACBNjtzd8nl6i++OnMFgjGS+tyvpsSlhrQEi2HtcybyhMA3ccX28I22TlEc7kTy0
 4LgrMS7GOByQvHi2pD2y9EkMMBf8/nUjyU4UaY6g1C5EaEAP2G3PAtNLZBaRcQy8C+v4EnksPfm
 noEzhO
X-Received: by 2002:a17:907:2d28:b0:9bf:697b:8f44 with SMTP id
 gs40-20020a1709072d2800b009bf697b8f44mr6733378ejc.6.1698979313531; 
 Thu, 02 Nov 2023 19:41:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj8ItR6ARgpxLWW8ZXsFRD1AjDYC8gptOiYDscDMcYxWPb9yjdvJ+NcwTXCgSU6cBODiLLHQ==
X-Received: by 2002:a17:907:2d28:b0:9bf:697b:8f44 with SMTP id
 gs40-20020a1709072d2800b009bf697b8f44mr6733360ejc.6.1698979313220; 
 Thu, 02 Nov 2023 19:41:53 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a1709061b1200b009b8a4f9f20esm366691ejg.102.2023.11.02.19.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 19:41:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith@gfxstrand.net
Date: Fri,  3 Nov 2023 03:41:06 +0100
Message-ID: <20231103024119.15031-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/gr/gf100-: unlock mutex failing to
 create golden context
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Do not return from gf100_gr_chan_new() with fecs mutex held when failing
to create the golden context image.

Cc: <stable@vger.kernel.org> # v6.2+
Fixes: ca081fff6ecc ("drm/nouveau/gr/gf100-: generate golden context during first object alloc")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index c494a1ff2d57..f72d3aa33442 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -442,6 +442,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 	if (gr->data == NULL) {
 		ret = gf100_grctx_generate(gr, chan, fifoch->inst);
 		if (ret) {
+			mutex_unlock(&gr->fecs.mutex);
 			nvkm_error(&base->engine.subdev, "failed to construct context\n");
 			return ret;
 		}
-- 
2.41.0


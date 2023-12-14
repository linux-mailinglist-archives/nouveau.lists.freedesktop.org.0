Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D35812408
	for <lists+nouveau@lfdr.de>; Thu, 14 Dec 2023 01:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C86810E0D9;
	Thu, 14 Dec 2023 00:44:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8106810E0D9
 for <nouveau@lists.freedesktop.org>; Thu, 14 Dec 2023 00:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702514647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ii5VSQ2/GUc2f4RzgYEeamHIhipYsVSJSGoA0nxmpuk=;
 b=P+KChm8jX2vS7B0ZSY/ttQoSAP8iKCEW0Sp7uVgTu7Pf7b46mcuCPklZ4ja+lO953G3u0+
 Pv1b7VUoiHiwQdQV+pPMtohr9SYVrp+VyLntxaxeKAczw6f3tGlzPAg22Yo46gM52LDBMR
 JZofa3UYVe2MluItsAILqbNg53+YfG4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-SeqMwaiINUeZe-0k0ms05A-1; Wed, 13 Dec 2023 19:44:03 -0500
X-MC-Unique: SeqMwaiINUeZe-0k0ms05A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D50E88CC40;
 Thu, 14 Dec 2023 00:44:03 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.8.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EB49492BE6;
 Thu, 14 Dec 2023 00:44:02 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/kms/nv50-: Don't allow inheritance of headless
 iors
Date: Wed, 13 Dec 2023 19:43:57 -0500
Message-ID: <20231214004359.1028109-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Cc: open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Borislav Petkov <bp@alien8.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Turns out we made a silly mistake when coming up with OR inheritance on
nouveau. On pre-DCB 4.1, iors are statically routed to output paths via the
DCB. On later generations iors are only routed to an output path if they're
actually being used. Unfortunately, it appears with NVIF_OUTP_INHERIT_V0 we
make the mistake of assuming the later is true on all generations, which is
currently leading us to return bogus ior -> head assignments through nvif,
which causes WARN_ON().

So - fix this by verifying that we actually know that there's a head
assigned to an ior before allowing it to be inherited through nvif. This
-should- hopefully fix the WARN_ON on GT218 reported by Borislav.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index e4279f1772a1b..377d0e0cef848 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -385,7 +385,7 @@ nvkm_uoutp_mthd_inherit(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	/* Ensure an ior is hooked up to this outp already */
 	ior = outp->func->inherit(outp);
-	if (!ior)
+	if (!ior || !ior->arm.head)
 		return -ENODEV;
 
 	/* With iors, there will be a separate output path for each type of connector - and all of
-- 
2.43.0


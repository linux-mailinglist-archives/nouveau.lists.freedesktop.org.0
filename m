Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C57C524E
	for <lists+nouveau@lfdr.de>; Wed, 11 Oct 2023 13:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20B510E724;
	Wed, 11 Oct 2023 11:41:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECAB10E724
 for <nouveau@lists.freedesktop.org>; Wed, 11 Oct 2023 11:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697024511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8NURkiBAbS6tTinRtwOYWNtz0h6Ztp9Eip3YWpE10Qw=;
 b=LZVx5Mt3VgIgces9Ge3MwFYpM8zPbvqA0RN5XhNCPHjYhIZMA23KVr5Zxkq8MZH6fxQ/Uh
 02MtGWD+5GieBNJhoRjJsLNGLJ7/GmiRdVPUnPuxwW3wEch844FJzVSVC+gNpXu/SZvSNc
 t9Wst8iPdfF69E2Jo9X3Prq+aW8dZc0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-uoEqpGcKOiy5_TBkWXlr6w-1; Wed, 11 Oct 2023 07:41:40 -0400
X-MC-Unique: uoEqpGcKOiy5_TBkWXlr6w-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-41b19426eedso9803301cf.1
 for <nouveau@lists.freedesktop.org>; Wed, 11 Oct 2023 04:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697024500; x=1697629300;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8NURkiBAbS6tTinRtwOYWNtz0h6Ztp9Eip3YWpE10Qw=;
 b=cLrXzx3iAZPbHPpl/7/n2hy1dXmPtoKsQgXdsN8cn6y+zrNKabMbg4lUhZr8mnuNQy
 gsdpHW0ZWnjOwlsXJN7RSWLNzr9uLzPmJe8KfvIYLladUgS+B9/q9lBYRynGvQbs73BR
 u0dGiyA7EBbYn66+fQXYLglehC47yVVrk43rByPmT1RUPJm33Ut2jSLXuNNW9WQdedvS
 biLYjqtkFj9VnswEnh/jAB32+BLsorcex1ODerI89tZiyJP5kMjdssKIPKHq6ZpSYHzf
 QlUM7ohH0a5j/7JOAvT1MAruu8q2M8fX2bhQog6cpXyHjgwtqhHakyADaKvAhcVQKNN8
 rVPg==
X-Gm-Message-State: AOJu0YxK81f55nH7bTtSwzCLV7V+873daWsGFmSDXhrNReRw+2lBiCNM
 AqrjxU21YFX2RzMUd/L8XyxHWGuJfyUvIWvwXerJ1vjRHMtQ+5XnFk6gWCv6PZaFWP+C32KP5xp
 OdUBcyLq/FpcsuPzmiK33YXuNdQ==
X-Received: by 2002:a05:6214:c6a:b0:65a:fd40:b79 with SMTP id
 t10-20020a0562140c6a00b0065afd400b79mr23067468qvj.5.1697024500038; 
 Wed, 11 Oct 2023 04:41:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/PJFqEzyZ8u0zaKxnpGRj7gcP1T2JeVyTubg38E45fbagYfNnX/UGlmnBkSjQ63uUN62XNg==
X-Received: by 2002:a05:6214:c6a:b0:65a:fd40:b79 with SMTP id
 t10-20020a0562140c6a00b0065afd400b79mr23067452qvj.5.1697024499781; 
 Wed, 11 Oct 2023 04:41:39 -0700 (PDT)
Received: from kherbst.pingu.com ([178.24.169.250])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a05620a136100b00774309d3e89sm5153179qkl.7.2023.10.11.04.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 04:41:38 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 11 Oct 2023 13:41:34 +0200
Message-ID: <20231011114134.861818-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH] drm/nouveau/disp: fix DP capable DSM connectors
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Just special case DP DSM connectors until we properly figure out how to
deal with this.

This resolves user regressions on GPUs with such connectors without
reverting the original fix.

Cc: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org # 6.4+
Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/255
Fixes: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not PMGR AUX interrupts")
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 46b057fe1412e..3249e5c1c8930 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -62,6 +62,18 @@ nvkm_uconn_uevent_gpio(struct nvkm_object *object, u64 token, u32 bits)
 	return object->client->event(token, &args, sizeof(args.v0));
 }
 
+static bool
+nvkm_connector_is_dp_dms(u8 type)
+{
+	switch (type) {
+	case DCB_CONNECTOR_DMS59_DP0:
+	case DCB_CONNECTOR_DMS59_DP1:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int
 nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
 {
@@ -101,7 +113,7 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 	if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_GPIO_LO;
 	if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ) {
 		/* TODO: support DP IRQ on ANX9805 and remove this hack. */
-		if (!outp->info.location)
+		if (!outp->info.location && !nvkm_connector_is_dp_dms(conn->info.type))
 			return -EINVAL;
 	}
 
-- 
2.41.0


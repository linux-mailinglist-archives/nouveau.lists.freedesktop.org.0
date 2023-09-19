Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F807A6DE9
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 00:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3CD10E29A;
	Tue, 19 Sep 2023 22:05:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B3E10E294
 for <nouveau@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Z+JX2xHxTv9H7TUJJN8OQN9V/8TOrxjOsWgkpZUiLU=;
 b=HqBaVlJE7P/jGUJGY9hfbDejVa7FD2TgjH7NA4TyisS3FI15HiQvvzebgISlOGFZHflxt0
 DOHzDcwdF1G7RWf1YImkjddKL0gDAKPMBirwsUl4igNKJPjCPaOyWSWNnmTqeiYu61d/U8
 21UoMtFDlSthCmWYXYO0RpXCa4r9k8s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-MDLoMPhwOv6y2pJ47KUNZQ-1; Tue, 19 Sep 2023 18:05:12 -0400
X-MC-Unique: MDLoMPhwOv6y2pJ47KUNZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1910801779;
 Tue, 19 Sep 2023 22:05:11 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F7A040C2064;
 Tue, 19 Sep 2023 22:05:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 17:56:00 -0400
Message-ID: <20230919220442.202488-6-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Nouveau] [PATCH v3 05/44] drm/nouveau/kms/nv50-: fix mst payload
 alloc fail crashing evo
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
 Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

Programming -1 (vc_start_slot, if alloc fails) into HW probably isn't
the best idea.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 39e9ba4139c7d..889ff667d0293 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -916,23 +916,27 @@ nv50_msto_prepare(struct drm_atomic_state *state,
 	struct nv50_mstc *mstc = msto->mstc;
 	struct nv50_mstm *mstm = mstc->mstm;
 	struct drm_dp_mst_atomic_payload *payload;
+	int ret = 0;
 
 	NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
 
 	payload = drm_atomic_get_mst_payload_state(mst_state, mstc->port);
 
-	// TODO: Figure out if we want to do a better job of handling VCPI allocation failures here?
 	if (msto->disabled) {
 		drm_dp_remove_payload_part1(mgr, mst_state, payload);
-
 		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0, 0, 0, 0);
+		ret = 1;
 	} else {
 		if (msto->enabled)
-			drm_dp_add_payload_part1(mgr, mst_state, payload);
+			ret = drm_dp_add_payload_part1(mgr, mst_state, payload);
+	}
 
+	if (ret == 0) {
 		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index,
 				      payload->vc_start_slot, payload->time_slots,
 				      payload->pbn, payload->time_slots * mst_state->pbn_div);
+	} else {
+		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0, 0, 0, 0);
 	}
 }
 
-- 
2.41.0


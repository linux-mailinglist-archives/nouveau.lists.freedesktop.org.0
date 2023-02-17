Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D519A69AD00
	for <lists+nouveau@lfdr.de>; Fri, 17 Feb 2023 14:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9353010F004;
	Fri, 17 Feb 2023 13:48:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7223A10EFF4
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 13:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5/2RnRF2JWHGpr9RK4XcaUSwl3Atw4selg5mVgZ4/g=;
 b=X/n01YSN1gpk+KK903jEsu4aTusHdMHCMKZku9kCbirFEX4XXlUq/tCUMe+2w/N0alUNbx
 rlmoxasiGW0XiRg3iteIbnlEuBUlKpAhisQrxs2MbWQeYDaahLzK5LJKy4ecL0dnZ2WMuc
 16iMaleWtdWNqmMfx67UI8K6Ie/XRaY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-BQSUEoh4MEOqUWxPI4C5tA-1; Fri, 17 Feb 2023 08:48:47 -0500
X-MC-Unique: BQSUEoh4MEOqUWxPI4C5tA-1
Received: by mail-ed1-f70.google.com with SMTP id
 x14-20020a05640226ce00b004acc4f8aa3fso1827298edd.3
 for <nouveau@lists.freedesktop.org>; Fri, 17 Feb 2023 05:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5/2RnRF2JWHGpr9RK4XcaUSwl3Atw4selg5mVgZ4/g=;
 b=glK1K1PyOHc4u/yVE8LPMt/5QEMRC93shyy+Yzr10ajG2rkcM6GNM/GVSJAfEagia7
 pQck+BTehp8amnvQuTVhjPYi13HFtQZYJJC7e78kWGdhiUeox10zWpfR11zfd7OGBaZb
 5gBBlgJHr/4PRmot7A5Mu5zue/tnPkno0R/aqnW5cUcOubgg8TDUuKYiEa1hMmK6XC1n
 DNj3ley2AN9GeRO2vHHiOsygGHdkycX+WbzyZtCESQZhqQNpf6W59UyNT5lRBlkOjtM4
 Nu+6c3gXNW4S101uKzgTpMqOpi0s6GgwWa9AGkSxR3Fm4JAl3717xotdqM9gCRkj/AQ9
 0+qQ==
X-Gm-Message-State: AO0yUKXtb4JbyHEXidpASSrSeh0YxV1NbT7b5BT6Dr6NBn5NlERHqSNR
 wgZYdTjxTu+zw2Ls8OPkuWqGh239cRAfl3LAtZozKggDi23bxKGLS6K5DfpQmh+I0L4SIPjc+yS
 kZxtRQHAyGabhawKJtCNuM3phEw==
X-Received: by 2002:a17:907:72c1:b0:8b1:7569:ad58 with SMTP id
 du1-20020a17090772c100b008b17569ad58mr4848791ejc.2.1676641726467; 
 Fri, 17 Feb 2023 05:48:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8dScSkWfRlq0RX8QSswoAOat82FsG+rCLCZ5wYVMw47uLr1CKX3blizMd0kItf9w+BCuGUrQ==
X-Received: by 2002:a17:907:72c1:b0:8b1:7569:ad58 with SMTP id
 du1-20020a17090772c100b008b17569ad58mr4848763ejc.2.1676641726232; 
 Fri, 17 Feb 2023 05:48:46 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a50d6d5000000b004aab36ad060sm2302248edj.92.2023.02.17.05.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:48:45 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Fri, 17 Feb 2023 14:48:15 +0100
Message-Id: <20230217134820.14672-6-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v2 11/16] drm/nouveau: fence: fail to
 emit when fence context is killed
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The new VM_BIND UAPI implementation introduced in subsequent commits
will allow asynchronous jobs processing push buffers and emitting
fences.

If a fence context is killed, e.g. due to a channel fault, jobs which
are already queued for execution might still emit new fences. In such a
case a job would hang forever.

To fix that, fail to emit a new fence on a killed fence context with
-ENODEV to unblock the job.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 7 +++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index ee5e9d40c166..62c70d9a32e6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,6 +96,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (nouveau_fence_signal(fence))
 			nvif_event_block(&fctx->event);
 	}
+	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -226,6 +227,12 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 		dma_fence_get(&fence->base);
 		spin_lock_irq(&fctx->lock);
 
+		if (unlikely(fctx->killed)) {
+			spin_unlock_irq(&fctx->lock);
+			dma_fence_put(&fence->base);
+			return -ENODEV;
+		}
+
 		if (nouveau_fence_update(chan, fctx))
 			nvif_event_block(&fctx->event);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 0ca2bc85adf6..00a08699bb58 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -45,7 +45,7 @@ struct nouveau_fence_chan {
 	char name[32];
 
 	struct nvif_event event;
-	int notify_ref, dead;
+	int notify_ref, dead, killed;
 };
 
 struct nouveau_fence_priv {
-- 
2.39.1


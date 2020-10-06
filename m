Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AD62853B6
	for <lists+nouveau@lfdr.de>; Tue,  6 Oct 2020 23:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B026E06D;
	Tue,  6 Oct 2020 21:13:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A976E06D
 for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2020 21:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602018815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0kBNgKQOAnL7/dsHF2Zqtu30aWPc0xloBucfVX1pxYE=;
 b=a3aM+VtxKFX1geBiQxibu+WScc2GTR7OuTYzR+q/AemtMZ8+AQ8/yaRhPrXLS7PChBqjC/
 XlhHd25kH4n7s0Dd+JCw6/pOTTVEvGfD7b/oBvAAiwmZHryqNOlm9P2ukpjA5v7waX42bI
 UO5HD54eH6+zt5XYIeDNsnPA4OaoadM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-APposSgOMvOfwRtDdaUqbA-1; Tue, 06 Oct 2020 17:13:34 -0400
X-MC-Unique: APposSgOMvOfwRtDdaUqbA-1
Received: by mail-qk1-f197.google.com with SMTP id k124so10254013qkc.13
 for <nouveau@lists.freedesktop.org>; Tue, 06 Oct 2020 14:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0kBNgKQOAnL7/dsHF2Zqtu30aWPc0xloBucfVX1pxYE=;
 b=nDkZdPFttQ3C1tgQeJutZ/OHdz9ZVxnQ5DVnC2TjSyz+UoFzJ0s5geBS8xbr+Ke00T
 OH/c6aCtEILSbZiFAVy+VF4W/a5E/H2GPJpr+3aegQFzfZB8LcV3aY7YN+UPu/VX5MXR
 YgE/9XW+ox3JlZoi8cRYb1Tk9R8s8eKblKcjadroRgeBtan5N3biEHyq1nvqIj9gSeRk
 FPcgyKXSWDNFjbNIcsOFEBtGJTeIseQowiu9ijnhriDTH1kBptdyCDLWR7kBpsQ/UKI6
 i+4QSBZuhuPJs3xnNfsVeg0NaS9nCtfwNwPckqYDsHQpTUoT24GHkwVsEsC0AXLznQ/N
 CfSw==
X-Gm-Message-State: AOAM532JkbeVB9c8wKjUG+oHnveXaetR4K7cMrbW2oBlXw82FqZEMJot
 g31SZoMO3koo1vGkXOK2/O71ppUhwVRJNxfufkCeSxezmyCnWwYBhYaTADDuAgN2MHyJXBxjhNc
 jE8HOBxEiZ5EiSZLTP8hA/rsrLA==
X-Received: by 2002:ac8:24f1:: with SMTP id t46mr195305qtt.93.1602018813459;
 Tue, 06 Oct 2020 14:13:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4jfnJbnsEJfe0i1w/szuuH4Sn65NM7a3nGf02iotE+B126bQNXHaev8F5HsUiQ7zhrEpGoQ==
X-Received: by 2002:ac8:24f1:: with SMTP id t46mr195276qtt.93.1602018813153;
 Tue, 06 Oct 2020 14:13:33 -0700 (PDT)
Received: from xps13.jcline.org ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id h68sm3714277qkf.30.2020.10.06.14.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 14:13:32 -0700 (PDT)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Date: Tue,  6 Oct 2020 17:13:11 -0400
Message-Id: <20201006211313.49177-2-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006211313.49177-1-jcline@redhat.com>
References: <20200911162128.405604-1-jcline@redhat.com>
 <20201006211313.49177-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [RFC PATCH v2 1/3] drm/nouveau/kms/nvd9-: Introduce some
 kernel-docs for CRC support
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is not complete documentation, but covers the pieces I read through
while reviewing the IGT CRC tests for nouveau. It covers the
nouveau-specific debugfs file, an overview of why the code is more
complicated than the DRM display CRC support documentation would lead
one to expect, and the nv50_crc_func vtable. Many of the details were
gleaned from Lyude's commit message, but I think it's valuable to have
them with the code rather than in the change log.

The rendered documentation of the functions in nv50_crc_func aren't as
nice as I'd like, but from what I can tell it would require creating a
typedef for each function with proper argument/return value docs.

Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/crc.c |  8 ++++
 drivers/gpu/drm/nouveau/dispnv50/crc.h | 65 ++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index b8c31b697797..84df41e8fb05 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -699,6 +699,14 @@ nv50_crc_debugfs_flip_threshold_set(struct file *file,
 	return ret;
 }
 
+/**
+ * DOC: nv_crc/flip_threshold
+ *
+ * The number of CRC entries to place in a :term:`CRC notifier context` before
+ * attempting to flip to the other notifier context. Writing ``-1`` to this file
+ * will reset the threshold to the default value, which is hardware-dependent.
+ * Values cannot be greater than the default or less than ``-1``.
+ */
 static const struct file_operations nv50_crc_flip_threshold_fops = {
 	.owner = THIS_MODULE,
 	.open = nv50_crc_debugfs_flip_threshold_open,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.h b/drivers/gpu/drm/nouveau/dispnv50/crc.h
index 4fce871b04c8..04ebb1f936db 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.h
@@ -10,6 +10,24 @@
 #include <nvkm/subdev/bios.h>
 #include "nouveau_encoder.h"
 
+/**
+ * DOC: Overview
+ *
+ * This interface is designed to aid in the implementation of the standard DRM
+ * CRC interface that is part of :doc:`drm-uapi`. NVIDIA's hardware has a
+ * peculiar CRC implementation that limits the number of CRCs that can be
+ * captured, which breaks the DRM API's expectations.
+ *
+ * CRCs are reported to a :term:`CRC notifier context` of limited size. Once the
+ * context fills, an overflow bit is set and no further CRCs are reported. To
+ * work around this, the driver flips between notifier contexts to allow users
+ * to capture an arbitrary number of CRCs.
+ *
+ * .. warning:: The flip requires flushing two separate updates on the
+ *     :term:`EVO/NVD` channel, and this results in the unavoidable loss of a single
+ *     frame's CRC.
+ */
+
 struct nv50_atom;
 struct nv50_disp;
 struct nv50_head;
@@ -49,16 +67,63 @@ struct nv50_crc_atom {
 	u8 wndw : 4;
 };
 
+/**
+ * struct nv50_crc_func - Functions and data for CRC support
+ *
+ * The interface used to abstract CRC support across card families that support
+ * it.
+ */
 struct nv50_crc_func {
+	/**
+	 * @set_src: Program the hardware to capture CRCs from the given
+	 * &enum nv50_crc_source_type. Using NULL for the source and ctx will
+	 * disable CRC for the given &struct nv50_head.
+	 *
+	 * Return 0 on success, or a negative error code.
+	 */
 	int (*set_src)(struct nv50_head *, int or, enum nv50_crc_source_type,
 		       struct nv50_crc_notifier_ctx *, u32 wndw);
+
+	/**
+	 * @set_ctx: Change the &struct nv50_crc_notifier_ctx used to capture
+	 * CRC entries. Providing a NULL context will remove any existing
+	 * context.
+	 *
+	 * Return 0 on success, or a negative error code.
+	 */
 	int (*set_ctx)(struct nv50_head *, struct nv50_crc_notifier_ctx *);
+
+	/**
+	 * @get_entry: Read the CRC entry at the given index. idx is guaranteed
+	 * to be less than @num_entries so implementations do not need to
+	 * perform a bounds check.
+	 *
+	 * Return the CRC or 0 if there is no CRC for the given index.
+	 */
 	u32 (*get_entry)(struct nv50_head *, struct nv50_crc_notifier_ctx *,
 			 enum nv50_crc_source, int idx);
+
+	/**
+	 * @ctx_finished: Return true when all requested CRCs have been written
+	 * and it is safe to read them.
+	 */
 	bool (*ctx_finished)(struct nv50_head *,
 			     struct nv50_crc_notifier_ctx *);
+
+	/**
+	 * @flip_threshold: The default number of CRC entries at which point the
+	 * notifier context should be flipped. This should be set somewhat lower
+	 * than @num_entries. It is configurable from userspace via DebugFS.
+	 */
 	short flip_threshold;
+
+	/**
+	 * @num_entries: The maximum number of entries supported in the
+	 * notifier context.
+	 */
 	short num_entries;
+
+	/** @notifier_len: The size of the notifier context in bytes. */
 	size_t notifier_len;
 };
 
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

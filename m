Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B05538E27
	for <lists+nouveau@lfdr.de>; Tue, 31 May 2022 12:00:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53661125B9;
	Tue, 31 May 2022 10:00:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC63A1125BA;
 Tue, 31 May 2022 10:00:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id y13so25606634eje.2;
 Tue, 31 May 2022 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nne0qJckA/hMuSOr0O9+SBShBUR9gCrIksc3pugIfaw=;
 b=O04QHlDY6DBBsKrGQS2x+dxNPUvaLGwatBhA9Ypf6fUvXeQn4u2iZyLs+G4Gopi2gn
 lMPnA9p2Gz45t7ICtHVl6tg1eE8albLaPc/BmmQBPg3ZJxqBikRQy57f7Gd//Yisj1mq
 76jYCx/vPIdNy0UXH2etO7PDMMWd1OqeisBEgyFTI9zNlOQxBgL6irhDuYoGR91FeUzH
 EGqVWW4gL9+MALPxEAxgJkeLA1KAldYG/7fZPitSHzltfhEhG1K7I0p/7oGL1xaLWwU1
 IWCc36zCKbmVtfqPjeE1k5dNjDQMnB1bXMwDXVEhisX6bguza7GDvQPXMaO9uEGf9zR/
 OIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nne0qJckA/hMuSOr0O9+SBShBUR9gCrIksc3pugIfaw=;
 b=FMs3zx2SH+5TneYLwNhIzgcJP3JZq/0sWoyrV3KWZFcr5Zn0Ubn9pxnGeAn2Rdkh3R
 lm2lTGl5GS5dOazR8K3bwO0W61fz/HnnuDCHn3jXs00pPvwx+0TcrY98vxp/IyXxOJVR
 3Rc+j7gJSaOAOB9bP9e14lnqnD5I1rsuxxGy41EGDSIRVki449wYYAyOzlFJ8XCpmkiV
 3a11PBDZVF2J00XUtD3G/e8ACNqxePdeQ4TFdD7SVn/GqzXa/LnhS38j5HtCPkMvLgCy
 Vrz3hl/kBzUvIkDA5iyqEakw52GaOUftuhQN8MwxKXugqkrOUMmgb+itsO+/UFiTbCGp
 3b7g==
X-Gm-Message-State: AOAM532Y1b6aQpnX9OKveVCm4pezpZnNbOtHKRSxe8pkndm8jp16S2kM
 h9vuegB3VbTWIMpSPYk68+IqeYrOs58+Ng==
X-Google-Smtp-Source: ABdhPJxmWnOcxxDaVC0tQGNbj0CSrxLQR0xy8ghD6daeqEn1NVbnq/aFqlXxIqVHd6RNxE0nHnKb2Q==
X-Received: by 2002:a17:907:3f13:b0:6ff:18ad:6936 with SMTP id
 hq19-20020a1709073f1300b006ff18ad6936mr25394163ejc.158.1653991216188; 
 Tue, 31 May 2022 03:00:16 -0700 (PDT)
Received: from able.fritz.box (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a056402018d00b0042617ba6389sm582062edv.19.2022.05.31.03.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 03:00:15 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Date: Tue, 31 May 2022 11:59:58 +0200
Message-Id: <20220531100007.174649-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531100007.174649-1-christian.koenig@amd.com>
References: <20220531100007.174649-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 04/13] dma-buf: provide oom badness for DMA-buf
 files
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
Cc: andrey.grodzovsky@amd.com, hughd@google.com, viro@zeniv.linux.org.uk,
 daniel@ffwll.ch, alexander.deucher@amd.com, akpm@linux-foundation.org,
 christian.koenig@amd.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

For now just return the size of the DMA-buf in pages as badness in the
OOM situation. That should probably be extended to be in control of the
exporter in the future.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index a2f9a1815e38..bdd4e8767cd3 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -388,6 +388,12 @@ static void dma_buf_show_fdinfo(struct seq_file *m, struct file *file)
 	spin_unlock(&dmabuf->name_lock);
 }
 
+static long dma_buf_oom_badness(struct file *file)
+{
+	/* TODO: This should probably be controlled by a flag */
+	return i_size_read(file_inode(file)) >> PAGE_SHIFT;
+}
+
 static const struct file_operations dma_buf_fops = {
 	.release	= dma_buf_file_release,
 	.mmap		= dma_buf_mmap_internal,
@@ -396,6 +402,7 @@ static const struct file_operations dma_buf_fops = {
 	.unlocked_ioctl	= dma_buf_ioctl,
 	.compat_ioctl	= compat_ptr_ioctl,
 	.show_fdinfo	= dma_buf_show_fdinfo,
+	.oom_badness	= dma_buf_oom_badness,
 };
 
 /*
-- 
2.25.1


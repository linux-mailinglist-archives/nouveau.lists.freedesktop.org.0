Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997423CB258
	for <lists+nouveau@lfdr.de>; Fri, 16 Jul 2021 08:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29756E910;
	Fri, 16 Jul 2021 06:19:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075056E90E;
 Fri, 16 Jul 2021 06:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=sygsfRFSOk2LlovSizKUNHUqhO0rzTrijIvq7CZ/O0Y=; b=Y4AO3a7NAwcP2J7xizpeyoehdR
 bXS1GzWEFEFs0kiy2Y8Pw0Py13TECeIZLSgUse1Te+QURRBDAjV2AIi5B2Mo0q4unZSLtnwg/oeFn
 AlkDQxI2FiktyzFSC3ycfD6A5XxqDG5I864sfKhGlCvLelJQeaLza0LSrD2BDAvCDtbiy2Of8ZBTt
 oFtRNoZQnGu1vnH0hel8zW+XZRt/RtyQ8XdeJiaXLMvqJTBm6aGhyV6O4AhgyQ5IxjRqzms9wHZKm
 47KzLsAm8W1I/hSKBu0dKaUOz/WPF6m7Dv3T35x3BnBjqhl8l9QKWk6kEgZWWfBREDLBWzpsQFNny
 zIhgoD4g==;
Received: from [2001:4bb8:184:8b7c:6b57:320d:f068:19c6] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4HAF-004CtO-L7; Fri, 16 Jul 2021 06:17:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Jul 2021 08:16:29 +0200
Message-Id: <20210716061634.2446357-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210716061634.2446357-1-hch@lst.de>
References: <20210716061634.2446357-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 2/7] vgaarb: remove vga_conflicts
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

vga_conflicts only has a single caller and none of the arch overrides
mentioned in the comment.  Just remove it and the thus dead check in the
caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/vga/vgaarb.c |  6 ------
 include/linux/vgaarb.h   | 12 ------------
 2 files changed, 18 deletions(-)

diff --git a/drivers/gpu/vga/vgaarb.c b/drivers/gpu/vga/vgaarb.c
index 949fde433ea2..fccc7ef5153a 100644
--- a/drivers/gpu/vga/vgaarb.c
+++ b/drivers/gpu/vga/vgaarb.c
@@ -284,12 +284,6 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
 		if (vgadev == conflict)
 			continue;
 
-		/* Check if the architecture allows a conflict between those
-		 * 2 devices or if they are on separate domains
-		 */
-		if (!vga_conflicts(vgadev->pdev, conflict->pdev))
-			continue;
-
 		/* We have a possible conflict. before we go further, we must
 		 * check if we sit on the same bus as the conflicting device.
 		 * if we don't, then we must tie both IO and MEM resources
diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index 26ec8a057d2a..ca5160218538 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -122,18 +122,6 @@ static inline void vga_set_default_device(struct pci_dev *pdev) { }
 static inline int vga_remove_vgacon(struct pci_dev *pdev) { return 0; }
 #endif
 
-/*
- * Architectures should define this if they have several
- * independent PCI domains that can afford concurrent VGA
- * decoding
- */
-#ifndef __ARCH_HAS_VGA_CONFLICT
-static inline int vga_conflicts(struct pci_dev *p1, struct pci_dev *p2)
-{
-       return 1;
-}
-#endif
-
 #if defined(CONFIG_VGA_ARB)
 int vga_client_register(struct pci_dev *pdev, void *cookie,
 			void (*irq_set_state)(void *cookie, bool state),
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

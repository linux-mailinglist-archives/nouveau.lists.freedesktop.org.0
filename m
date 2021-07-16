Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731023CB261
	for <lists+nouveau@lfdr.de>; Fri, 16 Jul 2021 08:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40176E90E;
	Fri, 16 Jul 2021 06:21:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0E56E90E;
 Fri, 16 Jul 2021 06:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=aSVhkxQ4oZroaS//zkndjisEcrFxS9kKgiUt3PZVNe8=; b=Q4U9970CPbVXAIeJ6cHePLZPfQ
 GTuuZa0Gg/5LRptQ+TwUQSKqatmLUVS2udxmulOOiu0kz20ecxvg25NURwP89Ay4hFxiE6dy84wCJ
 0Dn8I5R4v7ruZOegkbnxejDmjX53UFiQs3Y3tXytEDbXyUFAxT6wKYWq1FwfFVQYxDRSpFx8Rcxit
 cczj6lvyajlwh+ugYEbuTCBh9uid1zqfkDNGLBiaYfEeN+b3kvr13DorMmUxLgUWOE4HBG3AesDnQ
 AAPQp13tSkvbm8frYYNpUgSh+CrmOOuRCycpiBM6R25r5hFolqrqyWanUFSAtANufxrEcmerJn/Yy
 nQblM3uw==;
Received: from [2001:4bb8:184:8b7c:6b57:320d:f068:19c6] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4HBc-004CyC-Gy; Fri, 16 Jul 2021 06:19:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 16 Jul 2021 08:16:31 +0200
Message-Id: <20210716061634.2446357-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210716061634.2446357-1-hch@lst.de>
References: <20210716061634.2446357-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 4/7] vgaarb: cleanup vgaarb.h
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

Merge the different CONFIG_VGA_ARB ifdef blocks, remove superflous
externs, and regularize the stubs for !CONFIG_VGA_ARB.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/vgaarb.h | 90 ++++++++++++++++++++----------------------
 1 file changed, 42 insertions(+), 48 deletions(-)

diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index fdce9007d57e..05171fc7e26a 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -33,6 +33,8 @@
 
 #include <video/vga.h>
 
+struct pci_dev;
+
 /* Legacy VGA regions */
 #define VGA_RSRC_NONE	       0x00
 #define VGA_RSRC_LEGACY_IO     0x01
@@ -42,23 +44,47 @@
 #define VGA_RSRC_NORMAL_IO     0x04
 #define VGA_RSRC_NORMAL_MEM    0x08
 
-struct pci_dev;
-
-/* For use by clients */
-
-#if defined(CONFIG_VGA_ARB)
-extern void vga_set_legacy_decoding(struct pci_dev *pdev,
-				    unsigned int decodes);
-#else
+#ifdef CONFIG_VGA_ARB
+void vga_set_legacy_decoding(struct pci_dev *pdev, unsigned int decodes);
+int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible);
+void vga_put(struct pci_dev *pdev, unsigned int rsrc);
+struct pci_dev *vga_default_device(void);
+void vga_set_default_device(struct pci_dev *pdev);
+int vga_remove_vgacon(struct pci_dev *pdev);
+int vga_client_register(struct pci_dev *pdev, void *cookie,
+			void (*irq_set_state)(void *cookie, bool state),
+			unsigned int (*set_vga_decode)(void *cookie, bool state));
+#else /* CONFIG_VGA_ARB */
 static inline void vga_set_legacy_decoding(struct pci_dev *pdev,
-					   unsigned int decodes) { };
-#endif
-
-#if defined(CONFIG_VGA_ARB)
-extern int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible);
-#else
-static inline int vga_get(struct pci_dev *pdev, unsigned int rsrc, int interruptible) { return 0; }
-#endif
+		unsigned int decodes)
+{
+};
+static inline int vga_get(struct pci_dev *pdev, unsigned int rsrc,
+		int interruptible)
+{
+	return 0;
+}
+static inline void vga_put(struct pci_dev *pdev, unsigned int rsrc)
+{
+}
+static inline struct pci_dev *vga_default_device(void)
+{
+	return NULL;
+}
+static inline void vga_set_default_device(struct pci_dev *pdev)
+{
+}
+static inline int vga_remove_vgacon(struct pci_dev *pdev)
+{
+	return 0;
+}
+static inline int vga_client_register(struct pci_dev *pdev, void *cookie,
+				      void (*irq_set_state)(void *cookie, bool state),
+				      unsigned int (*set_vga_decode)(void *cookie, bool state))
+{
+	return 0;
+}
+#endif /* CONFIG_VGA_ARB */
 
 /**
  * vga_get_interruptible
@@ -90,36 +116,4 @@ static inline int vga_get_uninterruptible(struct pci_dev *pdev,
        return vga_get(pdev, rsrc, 0);
 }
 
-#if defined(CONFIG_VGA_ARB)
-extern void vga_put(struct pci_dev *pdev, unsigned int rsrc);
-#else
-static inline void vga_put(struct pci_dev *pdev, unsigned int rsrc)
-{
-}
-#endif
-
-
-#ifdef CONFIG_VGA_ARB
-extern struct pci_dev *vga_default_device(void);
-extern void vga_set_default_device(struct pci_dev *pdev);
-extern int vga_remove_vgacon(struct pci_dev *pdev);
-#else
-static inline struct pci_dev *vga_default_device(void) { return NULL; }
-static inline void vga_set_default_device(struct pci_dev *pdev) { }
-static inline int vga_remove_vgacon(struct pci_dev *pdev) { return 0; }
-#endif
-
-#if defined(CONFIG_VGA_ARB)
-int vga_client_register(struct pci_dev *pdev, void *cookie,
-			void (*irq_set_state)(void *cookie, bool state),
-			unsigned int (*set_vga_decode)(void *cookie, bool state));
-#else
-static inline int vga_client_register(struct pci_dev *pdev, void *cookie,
-				      void (*irq_set_state)(void *cookie, bool state),
-				      unsigned int (*set_vga_decode)(void *cookie, bool state))
-{
-	return 0;
-}
-#endif
-
 #endif /* LINUX_VGA_H */
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

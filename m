Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D00712A5C52
	for <lists+nouveau@lfdr.de>; Wed,  4 Nov 2020 02:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AF16F393;
	Wed,  4 Nov 2020 01:51:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0574B6EC79;
 Tue,  3 Nov 2020 10:43:33 +0000 (UTC)
Message-Id: <20201103095900.158813457@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604399647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=A3FdHqqNuzF3z/0IJSCiyvv2QQDa0OsdbIUscR1rN/Q=;
 b=Vi9y+RHz/u7318B+cqXyO0QOPlEr/gjlfn+MHQR6udcBs30/GV3fkr/dvBs0SdXzTqt8Vv
 IAeL/EsvoNuM0npj4K3u9xxlCyOA6DjplD94CEbFwEHSbeGyUzObif2rOtWpx16GZ2FaSV
 BFQeKovxHYQgdtDAgyF3ecey0ETZ5FDktyA4sKPZGPAmhVLw+ZE0IvGfmagwRzrtUJrhUk
 4BWflcJOEUxnvEGr/U26JqZvGFMUquFdL90X9KjoNtecwkKjLqCwqpsSI1UKdOGeF1Mo4K
 JWrbecA4+rPlCbBF6yRLES8dEl5nqwwXKsLrQ6HzdsmD3u+xUHjLwf9HAaMsaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604399647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=A3FdHqqNuzF3z/0IJSCiyvv2QQDa0OsdbIUscR1rN/Q=;
 b=YA2lOHqnjQm84xDc82K5Rmbii3lOSjdMhWJxq7WAnHE1z7PUvI9sl68g7t7UUaYnQOsgX5
 vH/eTyN9dMzQJnAA==
Date: Tue, 03 Nov 2020 10:27:47 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
References: <20201103092712.714480842@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Nov 2020 01:51:10 +0000
Subject: [Nouveau] [patch V3 35/37] drm/nouveau/device: Replace
 io_mapping_map_atomic_wc()
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, nouveau@lists.freedesktop.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
 David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Mel Gorman <mgorman@suse.de>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Chris Mason <clm@fb.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Neither fbmem_peek() nor fbmem_poke() require to disable pagefaults and
preemption as a side effect of io_mapping_map_atomic_wc().

Use io_mapping_map_local_wc() instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
---
V3: New patch
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/fbmem.h
@@ -60,19 +60,19 @@ fbmem_fini(struct io_mapping *fb)
 static inline u32
 fbmem_peek(struct io_mapping *fb, u32 off)
 {
-	u8 __iomem *p = io_mapping_map_atomic_wc(fb, off & PAGE_MASK);
+	u8 __iomem *p = io_mapping_map_local_wc(fb, off & PAGE_MASK);
 	u32 val = ioread32(p + (off & ~PAGE_MASK));
-	io_mapping_unmap_atomic(p);
+	io_mapping_unmap_local(p);
 	return val;
 }
 
 static inline void
 fbmem_poke(struct io_mapping *fb, u32 off, u32 val)
 {
-	u8 __iomem *p = io_mapping_map_atomic_wc(fb, off & PAGE_MASK);
+	u8 __iomem *p = io_mapping_map_local_wc(fb, off & PAGE_MASK);
 	iowrite32(val, p + (off & ~PAGE_MASK));
 	wmb();
-	io_mapping_unmap_atomic(p);
+	io_mapping_unmap_local(p);
 }
 
 static inline bool

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

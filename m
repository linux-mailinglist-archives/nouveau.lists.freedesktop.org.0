Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB012B30A
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FA76E39B;
	Fri, 27 Dec 2019 08:14:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BEF89CD8
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 20:10:48 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id a194so9752345qkg.10
 for <nouveau@lists.freedesktop.org>; Mon, 28 Oct 2019 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/THPQGyz40LBFYEHcweT4lmD8Nqu8ZrqzmWM4HcCKs=;
 b=Q6k/mUFVxOBv3aTuq8oo7JDrjEauKE9HcDgFt84omZdU9K/XVboyEcdOWxaTkCBJ28
 h0r5uedPPYCRhOvIEi8rMBg+LxDQ1kJy7G2KvTYOl8k1ftSUoOMiMEEi9CN59pf6OuOz
 MkDtPlTPswGrs8e2T9pzn8MdFhY0MZ1R+E+e8/2U9m/8aBR9ebJ0DsvWpb0j8hwE9f1i
 UuJJWkpCmSjN3VETuju98bl50r4w0WLDME6cbun6/34JTiAY6IEaZyv4ggnF2jWvcBtU
 qyxdFQalzd9YBNgYiQZmA0WiFjG+it9BlIMayLu3aVh2wFRpwpxXSydrKKoYGdfkI+Dw
 /p1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/THPQGyz40LBFYEHcweT4lmD8Nqu8ZrqzmWM4HcCKs=;
 b=TCWuZN1thYXamub3IsBej9yHLNYZ74sphKioGKFh5Ld79Kgnaii0Bb/8Jge366teih
 yDjG5NDi27FMGXjRA4tXPunblhmQCKbdrRhEErGPTBByg9rMZL8Wd0gdXkb6khTknWHt
 DT3a16zDxOdCkNLxuld0Mm7tcKi8jue7h2fplaSjjQTirUy3od52vo40LMfHnVROEQWR
 W7/ZwZ/3NTCvyUaM8x1O0EE0Wf/4XbSYX0jZiMFIAg+XiXFiO787GbCa1mT+OwVGoHPI
 zUQYhNcg3ayIDlLPIq5/mr4CjQ2L4ciujxT6Gc2qiO69hIMb1lQYKyJPGU1WvrlpXsCZ
 +rCw==
X-Gm-Message-State: APjAAAUufEYl53PNqpf0vNlR7if2aoYvQbVt0tmbTsBHy9dCJTyxVu6P
 mQ/nEnS3mFTwv1kGBQyVs3Bqkg==
X-Google-Smtp-Source: APXvYqxsKzO+DlZf4GHZfVwOfUDUz0csib+6zwvHr9p6l/rK8t+hVqnPNQxoUohuqD3TYtVARBRFtg==
X-Received: by 2002:a05:620a:1410:: with SMTP id
 d16mr14987766qkj.284.1572293447562; 
 Mon, 28 Oct 2019 13:10:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id q44sm8677492qtk.16.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001gk-DA; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Date: Mon, 28 Oct 2019 17:10:25 -0300
Message-Id: <20191028201032.6352-9-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH v2 08/15] xen/gntdev: Use select for
 DMA_SHARED_BUFFER
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

DMA_SHARED_BUFFER can not be enabled by the user (it represents a library
set in the kernel). The kconfig convention is to use select for such
symbols so they are turned on implicitly when the user enables a kconfig
that needs them.

Otherwise the XEN_GNTDEV_DMABUF kconfig is overly difficult to enable.

Fixes: 932d6562179e ("xen/gntdev: Add initial support for dma-buf UAPI")
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 drivers/xen/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
index 79cc75096f4232..a50dadd0109336 100644
--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -141,7 +141,8 @@ config XEN_GNTDEV
 
 config XEN_GNTDEV_DMABUF
 	bool "Add support for dma-buf grant access device driver extension"
-	depends on XEN_GNTDEV && XEN_GRANT_DMA_ALLOC && DMA_SHARED_BUFFER
+	depends on XEN_GNTDEV && XEN_GRANT_DMA_ALLOC
+	select DMA_SHARED_BUFFER
 	help
 	  Allows userspace processes and kernel modules to use Xen backed
 	  dma-buf implementation. With this extension grant references to
-- 
2.23.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

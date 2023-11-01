Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181B7DE8EA
	for <lists+nouveau@lfdr.de>; Thu,  2 Nov 2023 00:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3834B10E7E5;
	Wed,  1 Nov 2023 23:31:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484C510E7E2
 for <nouveau@lists.freedesktop.org>; Wed,  1 Nov 2023 23:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/VNYdgSll2ACKqst9EYQmPz34iqqPWKPy+dBFz8o6o=;
 b=YQRhEbsn9DX1gpBm9FGF/Fc1x6MBmYIqygdYVqIDtcbzYYYCptOSWcsN4vyqhf7G18JuyC
 qlLeIJmMm8gj58mE9B/b4Ca601GXAI9GTG2XzCiwFaSHh4caZn1S6TLQrqelACqlxNoKea
 RwFilGYNJEn/bWXshj7HecAZ76q0Jjk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-H5vVKXp7NFC-iHdKZ3uZ_w-1; Wed, 01 Nov 2023 19:31:31 -0400
X-MC-Unique: H5vVKXp7NFC-iHdKZ3uZ_w-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-54366567af4so358106a12.1
 for <nouveau@lists.freedesktop.org>; Wed, 01 Nov 2023 16:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881490; x=1699486290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/VNYdgSll2ACKqst9EYQmPz34iqqPWKPy+dBFz8o6o=;
 b=TnkS1r9TXH2fQO1+VfqvRTuYI6UEUl0ScYprH8ArSluIPmXWiTxlKhqN4S1lZFpz/v
 HctmXOsbm4IAW6ELOjmrShNi3Be/fa3oy4Ok29xh0Hz4YXviheC39wgphOoHLxewBJnr
 l2J6nrCM4HLLyAliZJyCFEYe+w4ZgWbBYEjQYLnKwDBnWAKOpPuM/BS3anqkJLyPUsVh
 0yq6rmiInnlj7f+8haA7PX4MaK6o6VKa1VM869rGfGQzjPeAkO8zePCyjwDLQGkgmbnt
 Nf82D0Vzqw8Mmn47xDpsj1BkFgKXgkgFy3sN8z+lliXVIKv5aN87V8+FPN6uUAivbNvo
 QVyg==
X-Gm-Message-State: AOJu0YxssJbNgkFU8Uu/Xt8o0eCXNDfB/w8g4wdzfDJEEVa6SlmfwjBB
 dQkhUd+gyVixi7hCuuENds2aRe0+kOw2v01V+neBFxkmOj8/KRZRTTXZY0OnLGR6a/cuYRzTgAS
 QOPGiaPFCJu6DLhJSTED612kiEQ==
X-Received: by 2002:aa7:d6c4:0:b0:543:42ac:c9f3 with SMTP id
 x4-20020aa7d6c4000000b0054342acc9f3mr3612979edr.19.1698881490023; 
 Wed, 01 Nov 2023 16:31:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRYXLwVkzVGPU7LguN6QpCv28Yb/7P5U0T7qrfr5WzCGdt3zscx7X5wozPytxOnq0whY0MOA==
X-Received: by 2002:aa7:d6c4:0:b0:543:42ac:c9f3 with SMTP id
 x4-20020aa7d6c4000000b0054342acc9f3mr3612974edr.19.1698881489858; 
 Wed, 01 Nov 2023 16:31:29 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a50d642000000b0053635409213sm1641016edj.34.2023.11.01.16.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:31:29 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Thu,  2 Nov 2023 00:30:55 +0100
Message-ID: <20231101233113.8059-4-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101233113.8059-1-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v8 03/12] drm/gpuvm: export
 drm_gpuvm_range_valid()
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Drivers may use this function to validate userspace requests in advance,
hence export it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 14 +++++++++++++-
 include/drm/drm_gpuvm.h     |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 445767f8fbc4..2669f9bbc377 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -649,7 +649,18 @@ drm_gpuvm_in_kernel_node(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 	return krange && addr < kend && kstart < end;
 }
 
-static bool
+/**
+ * drm_gpuvm_range_valid() - checks whether the given range is valid for the
+ * given &drm_gpuvm
+ * @gpuvm: the GPUVM to check the range for
+ * @addr: the base address
+ * @range: the range starting from the base address
+ *
+ * Checks whether the range is within the GPUVM's managed boundaries.
+ *
+ * Returns: true for a valid range, false otherwise
+ */
+bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
@@ -657,6 +668,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
+EXPORT_SYMBOL_GPL(drm_gpuvm_range_valid);
 
 /**
  * drm_gpuvm_init() - initialize a &drm_gpuvm
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 687fd5893624..13eac6f70061 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -253,6 +253,7 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    const struct drm_gpuvm_ops *ops);
 void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 
+bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 
 static inline struct drm_gpuva *
-- 
2.41.0

